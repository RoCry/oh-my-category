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
    NSInteger _selectedIndex;
}

- (id)initWithTitle:(NSString *)title
  cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
  otherButtonTitles:(NSString *)firstArg, ... {
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
        
        va_list args;
        va_start(args, firstArg);
        for (NSString *arg = firstArg; arg != nil; arg = va_arg(args, NSString*)){
            [_actionSheet addButtonWithTitle:arg];
            numOfButtons++;
        }
        va_end(args);
    
        if (cancelButtonTitle) {
            [_actionSheet addButtonWithTitle:cancelButtonTitle];
            numOfButtons++;
            _actionSheet.cancelButtonIndex = numOfButtons - 1;
        };
    }
    return self;
}

- (NSInteger)showInView:(UIView *)view {
    [_actionSheet showInView:view];
    CFRunLoopRun();
    return _selectedIndex;
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    _selectedIndex = buttonIndex;
    _actionSheet = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
}

@end
