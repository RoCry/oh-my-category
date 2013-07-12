//
//  UIViewController+Extensions.h
//  oh-my-category
//
//  Created by RoCry on 9/27/12.
//  Copyright (c) 2012 FeN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extensions)

- (BOOL)isVisible;

- (void)performIfIsVisible:(void (^)())handler;


// copied from https://github.com/worklist/cp_ios/
- (BOOL)isModal;

@end
