//
//  TestHistoryCell.h
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Test.h"

@interface TestHistoryCell : UITableViewCell

#pragma mark - Instance Methods

/**
 *  Fill table view cell with tset information
 *
 *  @param test Object to be used to fill table view cell
 */
- (void)fillWithTest:(Test *)test;

@end
