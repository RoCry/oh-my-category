//
//  RCUserGuideViewController.h
//  oh-my-category
//
//  Created by Tian Xia on 8/13/12.
//  Copyright (c) 2012 FeN. All rights unreserved.
//

#import <UIKit/UIKit.h>

@interface RCUserGuideViewController : UIViewController<UIScrollViewDelegate>
{
    BOOL pageControlIsChangingPage;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

/* for pageControl */
- (IBAction)changePage:(id)sender;

/* internal */
- (void)setupPage;

@end
