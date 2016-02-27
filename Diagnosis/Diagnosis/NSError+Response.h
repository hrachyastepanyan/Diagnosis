//
//  NSError+Response.h
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/23/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Response)

+ (NSError *)errorWithCode:(NSUInteger)code message:(NSString *)message;

@end
