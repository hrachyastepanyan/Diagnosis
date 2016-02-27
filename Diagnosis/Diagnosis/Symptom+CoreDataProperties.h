//
//  Symptom+CoreDataProperties.h
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Symptom.h"

NS_ASSUME_NONNULL_BEGIN

@interface Symptom (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *isExists;
@property (nullable, nonatomic, retain) NSNumber *isPassed;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *symptomId;
@property (nullable, nonatomic, retain) NSNumber *influencePercent;
@property (nullable, nonatomic, retain) NSString *question;
@property (nullable, nonatomic, retain) Disease *disease;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END
