//
//  RCSynchronizedActionSheet.h
//  oh-my-category
//
//  Created by Tian Xia on 9/4/12.
//  Copyright (c) 2012 FeN. All rights unreserved.
//

#import <Foundation/Foundation.h>

@interface RCSynchronizedActionSheet : NSObject<UIActionSheetDelegate>

@property (nonatomic, assign) NSString *title;
@property (nonatomic, assign) NSString *cancelButtonTitle;
@property (nonatomic, strong) NSArray *otherButtonTitles;
@property (nonatomic, strong) void (^completion)(NSInteger);

- (id)initWithTitle:(NSString *)title
  cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
  otherButtonTitles:(NSArray *)otherButtonTitles
         completion:(void (^)(NSInteger buttonIndex))completion;

- (void)showInView:(UIView *)view;

@end
