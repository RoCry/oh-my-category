//
//  RCViewController.h
//  oh-my-category
//
//  Created by  on 2012/4/7.
//  Copyright (c) 2012 7782. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *roundImageView;

- (IBAction)testChineseBirth:(id)sender;
- (IBAction)testShake:(id)sender;
- (IBAction)showUserGuide:(id)sender;
- (IBAction)crashBtnPressed:(id)sender;

@end
