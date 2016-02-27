//
//  DiagnosticLabManager.h
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLCoreDataManager.h"
#import "DLRequestManager.h"


@interface DiagnosticLabManager : NSObject

#pragma mark - Properties
@property (nonatomic, strong) Test *currentTest;

#pragma mark - Class Methods
+ (instancetype)sharedInstance;

#pragma mark - Instance Methods

/**
 *  @brief Create new test object instance
 *
 *  @discussion This method creates new instanse of Test object without saving it to database. To save created object you will need to call saveTest method.
 *
 *  @see saveTest
 *
 *  @return Created test object
 */
- (void)createNewTestWithSuccess:(void(^)())success
                         failure:(FailureHandler)failure;

/**
 *  Add symptom to user info
 *
 *  @param symptom Symptom to be added to user
 *  @param user    user description
 */
- (void)addSymptom:(Symptom *)symptom toUser:(User *)user;

/**
 *  Save test object in database
 *
 *  @param test Test object to be saved
 */
- (void)saveTest:(Test *)test;

/**
 *  Retrive list of taken tests
 *
 *  @return List of taken tests
 */
- (NSArray *)getAllTests;

/**
 *  Calculate possibility percent for Test
 *
 *  @return Possibility percent for Test
 */
- (NSInteger)possibilityPercentForTest:(Test *)test;

@end
