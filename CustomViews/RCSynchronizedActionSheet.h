//
//  RCSynchronizedActionSheet.h
//  oh-my-category
//
//  Created by Tian Xia on 9/4/12.
//  Copyright (c) 2012 7782. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCSynchronizedActionSheet : NSObject<UIActionSheetDelegate>

- (id)initWithTitle:(NSString *)title
  cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

- (NSInteger)showInView:(UIView *)view;

@end
