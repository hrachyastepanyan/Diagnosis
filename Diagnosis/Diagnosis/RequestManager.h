//
//  RequestManager.h
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^RequestSuccessHandler)(NSURLSessionTask *sessionTask, id responseObject);
typedef void(^RequestFailureHandler)(NSURLSessionTask *sessionTask, NSError *error);


@interface RequestManager : NSObject

#pragma mark - Public Methods
- (NSURLSessionTask *)POSTWithURLTail:(NSString *)urlTail
                          prarameters:(id)parameters
                              showHUD:(BOOL)showHUD
                              success:(RequestSuccessHandler)success
                              failure:(RequestFailureHandler)failure;

- (NSURLSessionTask *)GETWithURLTail:(NSString *)urlTail
                         prarameters:(id)parameters
                             showHUD:(BOOL)showHUD
                             success:(RequestSuccessHandler)success
                             failure:(RequestFailureHandler)failure;

@end
