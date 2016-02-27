//
//  DLRequestManager.m
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "DLRequestManager.h"

@interface DLRequestManager ()

@property (nonatomic, strong) RequestManager *requestManager;

@end

@implementation DLRequestManager

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        _requestManager = [RequestManager new];
    }
    
    return self;
}


#pragma mark - Instance Methods
- (void)getDiseaseWithParams:(NSDictionary *)params
                     success:(SuccessHandler)success
                     failure:(FailureHandler)failure {
    
    [_requestManager GETWithURLTail:GET_DISEASE_TAIL
                        prarameters:params
                            showHUD:YES
                            success:^(NSURLSessionTask *sessionTask, id responseObject) {
                                
                                if(success) {
                                    success(responseObject);
                                }
                            } failure:^(NSURLSessionTask *sessionTask, NSError *error) {
                                
                                if (error) {
                                    failure(error);
                                }
                            }];
}

- (void)uploadTestResultsWithParams:(NSDictionary *)params
                            success:(SuccessHandler)success
                            failure:(FailureHandler)failure {
    
    [_requestManager POSTWithURLTail:UPLOAD_TEST_RESULT_TAIL
                         prarameters:params
                             showHUD:NO
                             success:^(NSURLSessionTask *sessionTask, id responseObject) {
                                 
                                 if (success) {
                                     success(responseObject);
                                 }
                             } failure:^(NSURLSessionTask *sessionTask, NSError *error) {
                                 
                                 if (error) {
                                     failure(error);
                                 }
                             }];
    
}

@end
