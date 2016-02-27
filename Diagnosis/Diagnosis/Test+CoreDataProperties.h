//
//  Test+CoreDataProperties.h
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Test.h"

NS_ASSUME_NONNULL_BEGIN

@interface Test (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *testId;
@property (nullable, nonatomic, retain) NSDate *datePassed;
@property (nullable, nonatomic, retain) Disease *disease;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END
