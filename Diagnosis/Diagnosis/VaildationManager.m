//
//  VaildationManager.m
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/23/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "VaildationManager.h"
#import "NSError+Response.h"


#define EMPTY_NAME_CODE        60001
#define EMPTY_NAME_MESSAGE     @"Name is empty"


#define INVALID_PHONENUMBER_MESSAGE @"Phone Number is invalid"

@implementation VaildationManager

+ (NSError *)validateAsFullName:(NSString *)text {
    
    NSError *error = nil;
    
    if (text.length == 0) {
        error = [NSError errorWithCode:EMPTY_NAME_CODE message:EMPTY_NAME_MESSAGE];
    }
    
    return error;
}

@end
