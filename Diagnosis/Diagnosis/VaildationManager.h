//
//  VaildationManager.h
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/23/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VaildationManager : NSObject

/**
 *  Validate if given argument matches person name pattern
 *
 *  @param text Person name
 *
 *  @return Error message if given argument does not match person name pattern, nil otherwise
 */
+ (NSError *)validateAsFullName:(NSString *)text;

@end
