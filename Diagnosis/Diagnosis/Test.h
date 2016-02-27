//
//  Test.h
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Disease, User;

NS_ASSUME_NONNULL_BEGIN

@interface Test : NSManagedObject

- (NSInteger)possibilityPercent;

@end

NS_ASSUME_NONNULL_END

#import "Test+CoreDataProperties.h"
