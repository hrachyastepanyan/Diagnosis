//
//  AuthButton.m
//  DLButton.m
//  Diagnosis
//
//  Created by Hrachya Stepanyan on 2/21/16.
//  Copyright © 2016 Hrachya Stepanyan. All rights reserved.
//

#import "DLButton.h"

@implementation DLButton


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.layer.cornerRadius = self.frame.size.height/2;
}

@end
