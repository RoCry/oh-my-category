//
//  RCUserGuideViewController.m
//  oh-my-category
//
//  Created by Tian Xia on 8/13/12.
//  Copyright (c) 2012 FeN. All rights unreserved.
//

#import "RCUserGuideViewController.h"
#import <QuartzCore/QuartzCore.h>

#define DEFAULT_HEIGHT 480.0
#define DEFAULT_WIDTH 320.0
#define COUNT_OF_IMAGES 3

@interface RCUserGuideViewController (){
    NSArray *_imageViews;
    NSInteger _lastPage;
}

@end

@implementation RCUserGuideViewController
@synthesize scrollView = _scrollView;
@synthesize pageControl = _pageControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupPage];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    _lastPage = 0;
    [self addAnimationTo:0];
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [self setPageControl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark The Guts
- (void)setupPage{
	NSUInteger nimages = 0;
	CGFloat cx = 0;
    NSMutableArray *imagesMutableArray = [[NSMutableArray alloc]init];
	for (; ; nimages++) {
		NSString *imageName = [NSString stringWithFormat:@"wall_%d.png", (nimages + 1)];
		UIImage *image = [UIImage imageNamed:imageName];
		if (image == nil) {
			break;
		}
		UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [imagesMutableArray addObject:imageView];
		
		CGRect rect = imageView.frame;
		rect.size.height = DEFAULT_HEIGHT;
		rect.size.width = DEFAULT_WIDTH;
		rect.origin.x = ((self.scrollView.frame.size.width - DEFAULT_WIDTH) / 2) + cx;
		rect.origin.y = ((self.scrollView.frame.size.height - DEFAULT_HEIGHT) / 2);
        
		imageView.frame = rect;
        imageView.tag = nimages;
		[self.scrollView addSubview:imageView];
        
        NSString *textImageName = [NSString stringWithFormat:@"text_%d.png", (nimages + 1)];
        UIImageView *textImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:textImageName]];
        textImageView.frame = rect;
        [self.scrollView addSubview:textImageView];
        
        // add button in last pic
        if (nimages == COUNT_OF_IMAGES - 1) {
            UIImage *buttonImage = [UIImage imageNamed:@"welcome_start"];
            UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [startButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
            [startButton setFrame:CGRectMake(cx + 97, 397, 126, 42)];
            [startButton setAutoresizingMask:UIViewAutoresizingNone];
            [startButton addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollView addSubview:startButton];
        }
        
		cx += self.scrollView.frame.size.width;
	}
    _imageViews = [imagesMutableArray copy];
    
	self.pageControl.numberOfPages = nimages;
	[self.scrollView setContentSize:CGSizeMake(cx, [self.scrollView bounds].size.height)];
}

#pragma mark -
#pragma mark UIScrollViewDelegate stuff
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
    if (pageControlIsChangingPage) {
        return;
    }
    
	/*
	 *	We switch page at 50% across
	 */
    CGFloat pageWidth = aScrollView.frame.size.width;
    int page = floor((aScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    self.pageControl.currentPage = page;
}

// press the page controller enter this
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    pageControlIsChangingPage = NO;
    if (self.pageControl.currentPage != _lastPage) {
        _lastPage = self.pageControl.currentPage;
        [self addAnimationTo:self.pageControl.currentPage];
    }
}

// touch to scroll enter this
- (void)scrollViewDidEndDecelerating:(UIScrollView *)aScrollView
{
    pageControlIsChangingPage = NO;
    if (self.pageControl.currentPage != _lastPage) {
        _lastPage = self.pageControl.currentPage;
        [self addAnimationTo:self.pageControl.currentPage];
    }
}

#pragma mark -
#pragma mark PageControl stuff
- (IBAction)changePage:(id)sender
{
	/*
	 *	Change the scroll view
	 */
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * self.pageControl.currentPage;
    frame.origin.y = 0;
	
    [self.scrollView scrollRectToVisible:frame animated:YES];
    
	/*
	 *	When the animated scrolling finishings, scrollViewDidEndDecelerating will turn this off
	 */
    pageControlIsChangingPage = YES;
}

- (void)addAnimationTo:(NSInteger)page{
    for (UIView *view in _imageViews) {
        if (view.tag == page) {
            CAKeyframeAnimation *transformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
            NSMutableArray *values = [NSMutableArray array];
            [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)]];
            [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2f, 1.2f, 1.0f)]];
            [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)]];
            transformAnim.values = values;
            transformAnim.duration = 20;
            transformAnim.repeatCount = 1000;
            transformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            transformAnim.beginTime = 0;
            transformAnim.removedOnCompletion = NO;
            [view.layer addAnimation:transformAnim forKey:@"transform"];
            [view.superview sendSubviewToBack:view];
        }else {
            [view.layer removeAllAnimations];
        }
    }
}

- (void)start:(id)sender{
    
    [UIView animateWithDuration:1.0 animations:^{
        self.scrollView.alpha = 0;
    } completion:^(BOOL finished) {
        [self dismissModalViewControllerAnimated:NO];
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    }];
    
}

@end
