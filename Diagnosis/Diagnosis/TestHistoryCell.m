//
//  TestHistoryCell.m
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "TestHistoryCell.h"
#import "Test+CoreDataProperties.h"
#import "User+CoreDataProperties.h"
#import "Disease+CoreDataProperties.h"
#import "CircleProgressBar.h"
#import "DiagnosticLabManager.h"


@interface TestHistoryCell()

@property (nonatomic, weak) IBOutlet UILabel *pacientNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *diseaseNameLabel;
@property (nonatomic, weak) IBOutlet CircleProgressBar *circularProgressBar;
@property (nonatomic, strong) Test *test;

@end


@implementation TestHistoryCell

#pragma mark - Instance Methods
- (void)fillWithTest:(Test *)test {
    
    _test = test;
    
    _pacientNameLabel.text = test.user.name;
    _diseaseNameLabel.text = test.disease.diseaseName;
    
    _circularProgressBar.startAngle = -90;
    _circularProgressBar.progressBarWidth = 4.f;
    _circularProgressBar.hintViewBackgroundColor = [UIColor clearColor];
    NSInteger percent = [[DiagnosticLabManager sharedInstance] possibilityPercentForTest:_test];
    CGFloat progress = (float)percent / 100.f;
    [_circularProgressBar setProgress:progress animated:NO];
}

@end
