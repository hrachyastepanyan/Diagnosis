//
//  UIManager.h
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 10/27/15.
//  Copyright © 2015 Hrachya Stepanyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define kStoryboardMain    @"Main"


@interface UIManager : NSObject

#pragma mark - Class Methods
+ (instancetype)sharedManager;

#pragma mark - Instance Methods
- (UIViewController *)viewControllerWithClass:(Class)controllerClass inStoryboardWithName:(NSString *)storyboardName;
- (UIViewController *)initialViewControllerInStoryboard:(NSString *)storyboardName;

@end
