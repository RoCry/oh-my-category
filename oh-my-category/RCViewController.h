//
//  RCViewController.h
//  oh-my-category
//
//  Created by  on 2012/4/7.
//  Copyright (c) 2012 FeN. All rights unreserved.
//

#import <UIKit/UIKit.h>

@interface RCViewController : UIViewController<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *roundImageView;

- (IBAction)testChineseBirth:(id)sender;
- (IBAction)testShake:(id)sender;
- (IBAction)showUserGuide:(id)sender;
- (IBAction)crashBtnPressed:(id)sender;
- (IBAction)testSyncActionSheet:(id)sender;
- (IBAction)testSyncAlert:(id)sender;

@end
