//
//  NSError+Response.m
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/23/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "NSError+Response.h"


#define SURRO_ERROR_DOMAIN @"com.diagnosis.error"


@implementation NSError (Response)

+ (NSError *)errorWithCode:(NSUInteger)code message:(NSString *)message {
    
    NSError *error = [[NSError alloc] initWithDomain:SURRO_ERROR_DOMAIN
                                                code:code
                                            userInfo:@{NSLocalizedDescriptionKey : message}];
    
    return error;
}

@end
