//
//  RCViewController.m
//  oh-my-category
//
//  Created by  on 2012/4/7.
//  Copyright (c) 2012 7782. All rights reserved.
//

#import "RCViewController.h"
#import "NSDate+RoCry.h"
#import "NSDate+ChineseBirth.h"
#import "UIView+Shake.h"

@interface RCViewController ()

@end

@implementation RCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)testChineseBirth:(id)sender {
    NSDate *date = [NSDate getDateWithDateString:@"2000-07-07 00:14:35"   
                                    formatString:@"yyyy-MM-dd HH:mm:ss"];
    NSLog(@"your input date = %@",date);
    NSLog(@"input lunar date = %@",[date lunarForSolar]);
    
    NSLog(@"your next birthday by lunar date and display by solar date = %@",[date nextLunarBirthDateWithSolarDate]);
    NSLog(@"your next birthday by lunar date and display by lunar date = %@",[[date nextLunarBirthDateWithSolarDate]lunarForSolar]);
}

- (IBAction)testShake:(id)sender {
    [self.view shake];
}
@end
