//
//  MenuViewController.m
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "MenuViewController.h"
#import "DiagnosticLabManager.h"
#import "UIManager.h"
#import "PersonalInfoViewController.h"


@implementation MenuViewController


#pragma mark - Private Methods
- (IBAction)newTestButtonAction:(id)sender {
    
    [[DiagnosticLabManager sharedInstance] createNewTestWithSuccess:^() {
        
        UIViewController *viewController = [[UIManager sharedManager] viewControllerWithClass:[PersonalInfoViewController class]
                                                                         inStoryboardWithName:kStoryboardMain];
        [self.navigationController pushViewController:viewController animated:YES];
    } failure:^(NSError *error) {
        
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                   message:@"Couldn't load Syndrome details"
                                  delegate:nil
                         cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil, nil] show];
    }];
}


#pragma mark - Life Cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
