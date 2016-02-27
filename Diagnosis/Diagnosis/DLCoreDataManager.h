//
//  DLCoreDataManager.h
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test.h"
#import "User.h"
#import "Symptom.h"
#import "Disease.h"


@interface DLCoreDataManager : NSObject

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
- (Test *)createNewTestWithDiseaseDictionary:(NSDictionary *)diseaseDictionary;

/**
 *  Add symptom to user info
 *
 *  @param symptom Symptom to be added to user
 *  @param user    description
 */
- (void)addSymptom:(Symptom *)symptom toUser:(User *)user;

/**
 *  Save test object in DB
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
