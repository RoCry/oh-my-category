//
//  RCSynchronizedAlertView.h
//  oh-my-category
//
//  Created by Tian Xia on 9/4/12.
//  Copyright (c) 2012 7782. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCSynchronizedAlertView : NSObject

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

- (NSInteger)show;

@end
