//
//  User+CoreDataProperties.h
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *userId;
@property (nullable, nonatomic, retain) NSSet<Symptom *> *symptoms;
@property (nullable, nonatomic, retain) Test *test;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addSymptomsObject:(Symptom *)value;
- (void)removeSymptomsObject:(Symptom *)value;
- (void)addSymptoms:(NSSet<Symptom *> *)values;
- (void)removeSymptoms:(NSSet<Symptom *> *)values;

@end

NS_ASSUME_NONNULL_END
