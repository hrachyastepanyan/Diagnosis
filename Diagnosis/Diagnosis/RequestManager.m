//
//  RequestManager.m
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "RequestManager.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"

#define BASE_URL_STRING             @"http://private-017b60-toddssyndrome.apiary-mock.com/"

@interface RequestManager()

@property (nonatomic, strong) NSURLSessionConfiguration *sessionConfiguration;
@property (nonatomic, strong) AFURLSessionManager *sessionManager;

@end


@implementation RequestManager


#pragma mark - Life Cycle
- (instancetype)init {
    
    self = [super init];
    if (self) {
        _sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:_sessionConfiguration];
    }
    
    return self;
}


#pragma mark - Private Methods
- (NSUInteger)tagForHUD {
    
    static NSUInteger count;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        count = 0;
    });
    
    return count++;
}

- (void)showProgressHUDWithTag:(NSUInteger)tag {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
        progressHUD.tag = tag;
    });
}

- (void)hideProgressHUDWithTag:(NSUInteger)tag {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSArray *HUDs = [MBProgressHUD allHUDsForView:[UIApplication sharedApplication].delegate.window];
        
        for (MBProgressHUD *progressHUD in HUDs) {
            if (progressHUD.tag == tag) {
                progressHUD.removeFromSuperViewOnHide = YES;
                [progressHUD hide:YES];
                break;
            }
        }
    });
}

- (NSURLRequest *)createPOSTRequestWithURLTail:(NSString *)urlTail
                                    parameters:(id)parameters {
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@", BASE_URL_STRING, urlTail];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]
                                                           cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:40];
    if (parameters) {
        
        NSError *error = nil;
        NSData *body = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error];
        
        if (error) {
            NSLog(@"Error during request constrating %@", error);
        }
        
        if (body) {
            [request setHTTPBody:body];
        }
    }
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    return request;
}

- (NSURLRequest *)createGETRequestWithURLTail:(NSString *)urlTail
                                   parameters:(id)parameters {
    
    NSMutableString *urlQuery = [NSMutableString new];
    if ([parameters count] > 0) {
        [urlQuery appendString:@"?"];
        NSUInteger count = [[parameters allKeys] count];
        for (NSUInteger i = 0; i < count; ++i) {
            NSString *key = [[parameters allKeys] objectAtIndex:i];
            [urlQuery appendFormat:@"%@=%@", key, parameters[key]];
            if (i < count - 1) {
                [urlQuery appendString:@"&"];
            }
        }
    }
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@%@", BASE_URL_STRING, urlTail, urlQuery];
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];

    return request;
}

- (NSURLSessionTask *)sendRequest:(NSURLRequest *)request
                          success:(RequestSuccessHandler)success
                          failure:(RequestFailureHandler)failure {
    
    NSURLSessionDataTask *dataTask = [_sessionManager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (error) {
                if (failure) {
                    failure(dataTask, error);
                }
            }
            else {
                if (success) {
                    success(dataTask, responseObject);
                }
            }
        });
    }];
    [dataTask resume];
    
    return dataTask;
}


#pragma mark - Public Methods
- (NSURLSessionTask *)POSTWithURLTail:(NSString *)urlTail
                          prarameters:(id)parameters
                              showHUD:(BOOL)showHUD
                              success:(RequestSuccessHandler)success
                              failure:(RequestFailureHandler)failure {
    
    NSUInteger tag = [self tagForHUD];
    if (showHUD) {
        [self showProgressHUDWithTag:tag];
    }
    
    NSURLRequest *urlRequest = [self createPOSTRequestWithURLTail:urlTail parameters:parameters];
    NSURLSessionTask *urlSessionTask = [self sendRequest:urlRequest success:^(NSURLSessionTask *sessionTask, id responseObject) {

        if (showHUD) {
            [self hideProgressHUDWithTag:tag];
        }
        
        if (success) {
            success(sessionTask, responseObject);
        }

    } failure:^(NSURLSessionTask *sessionTask, NSError *error) {

        if (showHUD) {
            [self hideProgressHUDWithTag:tag];
        }
        
        failure(sessionTask, error);
    }];
    
    return urlSessionTask;
}

- (NSURLSessionTask *)GETWithURLTail:(NSString *)urlTail
                         prarameters:(id)parameters
                             showHUD:(BOOL)showHUD
                             success:(RequestSuccessHandler)success
                             failure:(RequestFailureHandler)failure {
    
    NSUInteger tag = [self tagForHUD];
    if (showHUD) {
        [self showProgressHUDWithTag:tag];
    }
    
    NSURLRequest *urlRequest = [self createGETRequestWithURLTail:urlTail parameters:parameters];
    NSURLSessionTask *urlSessionTask = [self sendRequest:urlRequest success:^(NSURLSessionTask *sessionTask, id responseObject) {
        
        if (showHUD) {
            [self hideProgressHUDWithTag:tag];
        }
        
        if (success) {
            success(sessionTask, responseObject);
        }
        
    } failure:^(NSURLSessionTask *sessionTask, NSError *error) {
        
        if (showHUD) {
            [self hideProgressHUDWithTag:tag];
        }
        
        failure(sessionTask, error);
    }];
    
    return urlSessionTask;
}

@end
