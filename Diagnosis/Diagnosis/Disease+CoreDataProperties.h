//
//  Disease+CoreDataProperties.h
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Disease.h"

NS_ASSUME_NONNULL_BEGIN

@interface Disease (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *diseaseId;
@property (nullable, nonatomic, retain) NSString *diseaseName;
@property (nullable, nonatomic, retain) NSSet<Symptom *> *symptoms;
@property (nullable, nonatomic, retain) Test *test;

@end

@interface Disease (CoreDataGeneratedAccessors)

- (void)addSymptomsObject:(Symptom *)value;
- (void)removeSymptomsObject:(Symptom *)value;
- (void)addSymptoms:(NSSet<Symptom *> *)values;
- (void)removeSymptoms:(NSSet<Symptom *> *)values;

@end

NS_ASSUME_NONNULL_END
