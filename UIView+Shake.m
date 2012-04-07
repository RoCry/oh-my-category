//
//  UIView+Shake.m
//  
//  Author:[FeN]RoCry
//  Blog:http://rocry.com
//  Email:crysheen@gmail.com
//
//  Created on 2012/4/7.
//  All rights unreserved.
//  

#import "UIView+Shake.h"

@implementation UIView (Shake)

- (void)horizontalMove:(CGFloat)offset 
            completion:(void (^)(void))completion{
    CGFloat duration = 0.1;
    [UIView animateWithDuration:duration animations:^{
        self.transform = CGAffineTransformMakeTranslation(offset, 0);
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

// just like the shake when u input a wrong password on mac login window
- (void)shake{
    [self horizontalMove:-9 completion:^{
        [self horizontalMove:5 completion:^{
            [self horizontalMove:-2 completion:^{
                [self horizontalMove:0 completion:nil];
            }];
        }];
    }];
}

@end
