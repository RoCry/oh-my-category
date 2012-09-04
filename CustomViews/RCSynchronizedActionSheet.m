//
//  RCSynchronizedActionSheet.m
//  oh-my-category
//
//  Created by Tian Xia on 9/4/12.
//  Copyright (c) 2012 FeN. All rights unreserved.
//

#import "RCSynchronizedActionSheet.h"

@implementation RCSynchronizedActionSheet{
    UIActionSheet *_actionSheet;
}

- (id)initWithTitle:(NSString *)title
  cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
  otherButtonTitles:(NSArray *)otherButtonTitles
         completion:(void (^)(NSInteger buttonIndex))completion
{
    self = [super init];
    if (self) {
        _actionSheet = [[UIActionSheet alloc] init];
        _actionSheet.delegate = self;
        _actionSheet.title = title;
        
        int numOfButtons = 0;
        
        if (destructiveButtonTitle) {
            [_actionSheet addButtonWithTitle:destructiveButtonTitle];
            _actionSheet.destructiveButtonIndex = 0;
            numOfButtons++;
        }
    
        for (NSString *otherButtonTitle in otherButtonTitles) {
            [_actionSheet addButtonWithTitle:otherButtonTitle];
            numOfButtons++;
        }
    
        if (cancelButtonTitle) {
            [_actionSheet addButtonWithTitle:cancelButtonTitle];
            numOfButtons++;
            _actionSheet.cancelButtonIndex = numOfButtons - 1;
        };
        
        self.completion = completion;
    }
    return self;
}

- (void)showInView:(UIView *)view {
    [_actionSheet showInView:view];
    CFRunLoopRun();
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    self.completion(buttonIndex);
    CFRunLoopStop(CFRunLoopGetCurrent());
}

@end
