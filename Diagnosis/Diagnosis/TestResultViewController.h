//
//  TestResultViewController.h
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/27/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "Test.h"

@interface TestResultViewController : BaseViewController

@property (nonatomic, strong) Test *test;

@end
