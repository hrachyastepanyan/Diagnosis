//
//  PersonalInfoViewController.m
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "VaildationManager.h"
#import "DiagnosticLabManager.h"


@interface PersonalInfoViewController() <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *fullNameTextField;

@end


@implementation PersonalInfoViewController

#pragma mark - Private Methods
- (IBAction)singleTapped:(id)sender {

    [self.view endEditing:YES];
}

- (IBAction)nextButtonAction:(id)sender {
    
    NSError *error = [VaildationManager validateAsFullName:_fullNameTextField.text];
    if (error) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                 message:error.localizedDescription
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertController addAction:OKAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else {
        Test *currentTest = [[DiagnosticLabManager sharedInstance] currentTest];
        currentTest.user.name = _fullNameTextField.text;
        [self performSegueWithIdentifier:@"PersonalInfoViewController" sender:self];
    }
}


#pragma mark - Life Cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.view endEditing:YES];
    return YES;
}

@end
