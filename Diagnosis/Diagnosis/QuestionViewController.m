//
//  QuestionViewController.m
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "QuestionViewController.h"
#import "UIManager.h"
#import "DiagnosticLabManager.h"
#import "TestResultViewController.h"


@interface QuestionViewController()

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, strong) Symptom *notPassedSymptom;

@end


@implementation QuestionViewController

#pragma mark - Private Methods
- (Symptom *)findNotPassedSymptom {
    
    Symptom *notPassedSymptom = nil;
    
    Test *currentTest = [[DiagnosticLabManager sharedInstance] currentTest];
    for (Symptom *symptom in currentTest.disease.symptoms) {
        if (![symptom.isPassed boolValue]) {
            notPassedSymptom = symptom;
            break;
        }
    }
    
    return notPassedSymptom;
}

- (void)goNextScreen {
    
    UIViewController *viewController = nil;
    if ([self findNotPassedSymptom]) {
        viewController = [[UIManager sharedManager] viewControllerWithClass:[QuestionViewController class]
                                                       inStoryboardWithName:kStoryboardMain];
    }
    else {
        viewController = [[UIManager sharedManager] viewControllerWithClass:[TestResultViewController class]
                                                       inStoryboardWithName:kStoryboardMain];
        [(TestResultViewController *)viewController setTest:[[DiagnosticLabManager sharedInstance] currentTest]];
    }
    
    if (viewController) {
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

- (IBAction)noButtonAction:(id)sender {
    
    _notPassedSymptom.isPassed = @(YES);
    _notPassedSymptom.isExists = @(NO);
    Test *currentTest = [[DiagnosticLabManager sharedInstance] currentTest];
    [[DiagnosticLabManager sharedInstance] addSymptom:_notPassedSymptom toUser:currentTest.user];
    [self goNextScreen];
}

- (IBAction)yesButtonAction:(id)sender {
    
    _notPassedSymptom.isPassed = @(YES);
    _notPassedSymptom.isExists = @(YES);
    Test *currentTest = [[DiagnosticLabManager sharedInstance] currentTest];
    [[DiagnosticLabManager sharedInstance] addSymptom:_notPassedSymptom toUser:currentTest.user];
    [self goNextScreen];
}


#pragma mark - Life Cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    _notPassedSymptom = [self findNotPassedSymptom];
    _questionLabel.text = _notPassedSymptom.question;
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
