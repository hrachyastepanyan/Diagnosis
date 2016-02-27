//
//  DLCoreDataManager.m
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "DLCoreDataManager.h"
#import "ObjectiveRecord.h"

#define kDiseaseName        @"name"
#define kSymptoms           @"symptoms"

#define kSymptomeName       @"name"
#define kSymptomeInfluence  @"influence_percent"
#define kSymptomeQuestion   @"question"


@implementation DLCoreDataManager

#pragma mark - Life Cycle
- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        [[CoreDataManager sharedManager] setModelName:@"DiagnosticLab"];
    }
    return self;
}

#pragma mark - Private Methods

- (Disease *)generateDisease {
    
    Disease *disease = [Disease create];
    
    disease.diseaseName = @"Todd's Syndrome";
    
    Symptom *migrainesSymptom = [Symptom create];
    migrainesSymptom.name = @"Migraines";
    migrainesSymptom.question = @"Do you have migraines?";
    migrainesSymptom.isPassed = @(NO);
    migrainesSymptom.influencePercent = @(25);
    [disease addSymptomsObject:migrainesSymptom];
    
    Symptom *ageSymptom = [Symptom create];
    ageSymptom.name = @"Age";
    ageSymptom.question = @"Are you yunger than 15?";
    ageSymptom.isPassed = @(NO);
    ageSymptom.influencePercent = @(25);
    [disease addSymptomsObject:ageSymptom];
    
    Symptom *genderSymptom = [Symptom create];
    genderSymptom.name = @"Gender";
    genderSymptom.question = @"Are you a man?";
    genderSymptom.isPassed = @(NO);
    genderSymptom.influencePercent = @(25);
    [disease addSymptomsObject:genderSymptom];
    
    Symptom *drugsSymptom = [Symptom create];
    drugsSymptom.name = @"Drugs";
    drugsSymptom.question = @"Do you use hallucinogenic drugs?";
    drugsSymptom.isPassed = @(NO);
    drugsSymptom.influencePercent = @(25);
    [disease addSymptomsObject:drugsSymptom];
    
    return disease;
}

- (Disease *)createDiseaseWithDictionary:(NSDictionary *)diseaseDictionary {
    
    Disease *disease = [Disease create];
    
    NSString* diseaseName = diseaseDictionary[kDiseaseName];
    if (diseaseName) {
        disease.diseaseName = diseaseName;
    }
    
    NSArray* symptomsArray = diseaseDictionary[kSymptoms];
    if (symptomsArray && [symptomsArray isKindOfClass:[NSArray class]]) {
        
        for (NSDictionary* symptomeDictionary in symptomsArray) {
            
            Symptom *symptom = [Symptom create];
            symptom.isPassed = @(NO);
            
            if (symptomeDictionary[kSymptomeName]) {
                symptom.name = symptomeDictionary[kSymptomeName];
            }
            
            if (symptomeDictionary[kSymptomeQuestion]) {
                symptom.question = symptomeDictionary[kSymptomeQuestion];
            }
            
            if (symptomeDictionary[kSymptomeInfluence]) {
                symptom.influencePercent = symptomeDictionary[kSymptomeInfluence];
            }
            
            [disease addSymptomsObject:symptom];
        }
    }
    
    return disease;
}

#pragma mark - Instance Methods
- (Test*)createNewTestWithDiseaseDictionary:(NSDictionary *)diseaseDictionary {
    
    Test *test = [Test create];
    test.datePassed = [NSDate date];
    
    User *user = [User create];
    [test setUser:user];
    
    Disease *disease = [self createDiseaseWithDictionary:diseaseDictionary];
    [test setDisease:disease];
    
    return test;
}

- (void)addSymptom:(Symptom *)symptom toUser:(User *)user {
    
    [user addSymptomsObject:symptom];
    [user save];
}

- (void)saveTest:(Test *)test {
    
    [test save];
}

- (NSArray *)getAllTests {
    
    return [Test allWithOrder:@"datePassed DESC"];
}

- (NSInteger)possibilityPercentForTest:(Test *)test {
    
    return [test possibilityPercent];
}


@end
