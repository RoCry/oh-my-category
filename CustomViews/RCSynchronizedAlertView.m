//
//  RCSynchronizedAlertView.m
//  oh-my-category
//
//  Created by Tian Xia on 9/4/12.
//  Copyright (c) 2012 FeN. All rights unreserved.
//

#import "RCSynchronizedAlertView.h"

@implementation RCSynchronizedAlertView{
    UIAlertView *_alertView;
    NSInteger _selectedIndex;
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)firstArg, ...{
    self = [super init];
    if (self) {
        _alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
        
        va_list args;
        va_start(args, firstArg);
        for (NSString *arg = firstArg; arg != nil; arg = va_arg(args, NSString*)){
            [_alertView addButtonWithTitle:arg];
        }
        va_end(args);
    }
    return self;
}

- (NSInteger)show{
    [_alertView show];
    CFRunLoopRun();
    return _selectedIndex;
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex;{
    _selectedIndex = buttonIndex;
    _alertView = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
}

@end
