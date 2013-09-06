//
//  UIColor+RoCry.m
//  oh-my-category
//
//  Created by Summer on 13-9-6.
//  Copyright (c) 2013年 7782. All rights reserved.
//

#import "UIColor+RoCry.h"

@implementation UIColor (RoCry)

+ (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
