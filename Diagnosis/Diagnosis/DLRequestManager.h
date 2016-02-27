//
//  DLRequestManager.h
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestManager.h"

#define GET_DISEASE_TAIL                 @"disease"
#define UPLOAD_TEST_RESULT_TAIL          @"tests"

typedef void(^SuccessHandler)(NSDictionary *result);
typedef void(^FailureHandler)(NSError *error);

@interface DLRequestManager : NSObject

#pragma mark - Instance Methods
- (void)getDiseaseWithParams:(NSDictionary *)params
                     success:(SuccessHandler)success
                     failure:(FailureHandler)failure;

- (void)uploadTestResultsWithParams:(NSDictionary *)params
                            success:(SuccessHandler)success
                            failure:(FailureHandler)failure;
@end
