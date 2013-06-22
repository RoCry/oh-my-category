//
//  RCViewController.m
//  oh-my-category
//
//  Created by  on 2012/4/7.
//  Copyright (c) 2012 FeN. All rights unreserved.
//

#import "RCViewController.h"
#import "NSDate+RoCry.h"
#import "NSDate+ChineseBirth.h"
#import "UIView+Shake.h"
#import "RCUserGuideViewController.h"
#import "UncaughtExceptionHandler.h"
#import "MacrosFunc.h"

@interface RCViewController ()

@end

@implementation RCViewController
@synthesize roundImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.roundImageView.image = [UIImage imageNamed:@"heartocat"];
    
    InstallUncaughtExceptionHandler();
    
    NSLog(@"bundle version: %@", APP_VERSION);
}

- (void)viewDidUnload
{
    [self setRoundImageView:nil];
    [super viewDidUnload];
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

- (IBAction)showUserGuide:(id)sender {
    UIViewController *nextVC = [[RCUserGuideViewController alloc] init];
    [self presentViewController:nextVC animated:YES completion:nil];
}

- (IBAction)crashBtnPressed:(id)sender {
    [self performSelector:@selector(asdfghjkl)];
}

@end
