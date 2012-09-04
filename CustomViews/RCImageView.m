//
//  RCImageView.m
//  oh-my-category
//
//  Created by Tian Xia on 8/27/12.
//  Copyright (c) 2012 FeN. All rights unreserved.
//
#define CORNER_RADIUS 5.0

#import <QuartzCore/QuartzCore.h>
#import "RCImageView.h"

@implementation RCImageView
@synthesize image = _image;

- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    [[UIColor whiteColor] set];
    UIRectFill(bounds);
    
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:CORNER_RADIUS] addClip];
    
    [self.image drawInRect:bounds];
    UIImage *shadow_image = [[UIImage imageNamed:@"shadow_mask"]stretchableImageWithLeftCapWidth:CORNER_RADIUS topCapHeight:CORNER_RADIUS];
    
    [shadow_image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

@end
