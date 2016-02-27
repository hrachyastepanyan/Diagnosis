//
//  DiagnosticLabManager.m
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "DiagnosticLabManager.h"


@interface DiagnosticLabManager ()

@property (nonatomic, strong) DLCoreDataManager *coreDataManager;
@property (nonatomic, strong) DLRequestManager *requestManager;

@end


@implementation DiagnosticLabManager

#pragma mark - Life Cycle
- (instancetype)init {
    
    self = [super init];
    if (self) {
        _coreDataManager = [[DLCoreDataManager alloc] init];
        _requestManager = [[DLRequestManager alloc] init];
    }
    return self;
}


#pragma mark - Class Methods
+ (instancetype)sharedInstance {
    
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

#pragma mark - Instance Methods
- (NSDictionary *)uploadParametersWithTask:(Test *)test {
    
    NSMutableDictionary *uploadParameters = [NSMutableDictionary new];
    NSMutableDictionary *userDictionary = [NSMutableDictionary new];

    if (test.disease.diseaseId) {
        uploadParameters[@"diseaseId"] = test.disease.diseaseId;
    }
    
    if (test.user.name) {
        userDictionary[@"userName"] = test.user.name;
    }
    
    NSMutableArray *symptomsArray = [NSMutableArray new];
    for (Symptom *symptom in test.user.symptoms) {
        
        [symptomsArray addObject:@{ @"symptomId" : symptom.symptomId ? symptom.symptomId : @(0),
                                    @"name" : symptom.name ? symptom.name : @"",
                                    @"influencePercent" : symptom.influencePercent ? symptom.influencePercent : @(0)}];
    }

    userDictionary[@"symptoms"] = symptomsArray;
    uploadParameters[@"user"] = userDictionary;
    
    return uploadParameters;
}


#pragma mark - Instance Methods
- (void)createNewTestWithSuccess:(void(^)())success
                         failure:(void(^)(NSError *error))failure {
    
    [_requestManager getDiseaseWithParams:nil success:^(NSDictionary *result) {
        
        _currentTest = [_coreDataManager createNewTestWithDiseaseDictionary:result];
        if (success) {
            success();
        }
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

- (void)addSymptom:(Symptom *)symptom toUser:(User *)user {
    
    [_coreDataManager addSymptom:symptom toUser:user];
}

- (void)saveTest:(Test *)test {
    
    [_coreDataManager saveTest:test];
    [_requestManager uploadTestResultsWithParams:[self uploadParametersWithTask:test]
                                         success:^(NSDictionary *result) {
                                             
                                             NSLog(@"uploadTestResultsWithParams: result = %@", result);
                                         }
                                         failure:^(NSError *error) {
                                             
                                             NSLog(@"uploadTestResultsWithParams: error = %@", error);
                                         }];
}

- (NSArray *)getAllTests {
    
    NSArray* tests = [_coreDataManager getAllTests];
    
    return tests;
}

- (NSInteger)possibilityPercentForTest:(Test *)test {
    
    return [_coreDataManager possibilityPercentForTest:test];
}

@end
