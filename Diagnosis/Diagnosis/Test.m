//
//  Test.m
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "Test.h"
#import "Disease.h"
#import "User.h"
#import "Symptom.h"


@implementation Test

- (NSInteger)possibilityPercent {
    
    NSInteger posibilityPercent = 0;
    
    for (Symptom *symptom in self.user.symptoms) {
        
        if ([symptom.isExists boolValue]) {
            posibilityPercent += [symptom.influencePercent integerValue];
        }
    }
    return posibilityPercent;
}

@end
