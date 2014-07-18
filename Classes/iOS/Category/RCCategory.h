//
//  RCCategory.h
//  oh-my-category
//
//  Created by RoCry on 1/23/14.
//  Copyright (c) 2014 FeN. All rights reserved.
//

// some short category here
@interface UIColor (RoCry)

+ (UIColor *)randomColor;
+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*)colorWithHex:(NSInteger)hexValue;

@end