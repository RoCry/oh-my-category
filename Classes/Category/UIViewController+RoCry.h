//
//  UIViewController+RoCry.h
//  GithubMobile
//
//  Created by Tian Xia on 8/4/12.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (RoCry)

- (void)createRightBtn:(NSString*)btnTitle action:(SEL)action;

- (void)createBackBtn;

- (void)createBackBtn:(NSString *)btnTitle action:(SEL)action;

@end
