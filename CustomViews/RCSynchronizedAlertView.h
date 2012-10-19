//
//  RCSynchronizedAlertView.h
//  oh-my-category
//
//  Created by Tian Xia on 9/4/12.
//  Copyright (c) 2012 FeN. All rights unreserved.
//

#import <Foundation/Foundation.h>
DEPRECATED_ATTRIBUTE // see https://github.com/zhangxigithub/BlockUI
@interface RCSynchronizedAlertView : NSObject

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

- (NSInteger)show;

@end
