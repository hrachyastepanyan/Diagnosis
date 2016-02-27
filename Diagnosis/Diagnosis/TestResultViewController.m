//
//  TestResultViewController.m
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "TestResultViewController.h"
#import "DiagnosticLabManager.h"
#import "CircleProgressBar.h"


@interface TestResultViewController ()

@property (nonatomic, weak) IBOutlet UILabel *pacientNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *diseaseNameLabel;
@property (nonatomic, weak) IBOutlet CircleProgressBar *circularProgressBar;

@end


@implementation TestResultViewController

#pragma mark - Private Methods
- (IBAction)menuButtonAction:(UIBarButtonItem *)sender {

    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - Life Cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[DiagnosticLabManager sharedInstance] saveTest:_test];
    _pacientNameLabel.text = [NSString stringWithFormat:@"Pacient name: %@", _test.user.name];
    _diseaseNameLabel.text = [NSString stringWithFormat:@"Disease name: %@", _test.disease.diseaseName];
    self.navigationItem.hidesBackButton = YES;
    
    _circularProgressBar.startAngle = -90;
    _circularProgressBar.progressBarWidth = 8.f;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];

    NSInteger percent = [[DiagnosticLabManager sharedInstance] possibilityPercentForTest:_test];
    CGFloat progress = (float)percent / 100.f;
    [_circularProgressBar setProgress:progress animated:YES];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
