//
//  UIViewController+RoCry.m
//  GithubMobile
//
//  Created by Tian Xia on 8/4/12.
//
//

#import "UIViewController+RoCry.h"

@implementation UIViewController (RoCry)

- (void)createRightBtn:(NSString*)btnTitle action:(SEL)action{
    UIImage *bgImg = [UIImage imageNamed:@"button_blue.png"];
    int width = bgImg.size.width;
    int height = bgImg.size.height;
    CGSize bgSize = bgImg.size;
    bgImg = [bgImg resizableImageWithCapInsets:UIEdgeInsetsMake(0.4*height, 0.4*width, 0.4*height, 0.4*width)];;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:bgImg forState:UIControlStateNormal];
    [btn setContentVerticalAlignment:UIControlContentVerticalAlignmentFill];
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    [btn titleLabel].font = [UIFont boldSystemFontOfSize:12];
    btn.titleLabel.shadowColor = [UIColor blackColor];
    btn.titleLabel.shadowOffset = CGSizeMake(0, -1);
	[btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn sizeToFit];
    CGRect frame = btn.frame;
    if(frame.size.width > bgSize.width) {
        frame.size.width += 10;
        frame.size.height = bgSize.height;
        btn.frame = frame;
    } else {
        btn.frame = CGRectMake(0, 0, bgSize.width, bgSize.height);
    }
    
	UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
}

- (void)createBackBtn{
    [self createBackBtn:nil action:nil];
}

- (void)createBackBtn:(NSString *)btnTitle action:(SEL)action{
    
    UIImage *bgImg = [UIImage imageNamed:@"button_back.png"];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0.0, 0.0, bgImg.size.width, bgImg.size.height);
    [backBtn setBackgroundImage:bgImg forState:UIControlStateNormal];
    [backBtn setContentVerticalAlignment:UIControlContentVerticalAlignmentFill];
    [backBtn titleLabel].font = [UIFont boldSystemFontOfSize:12];
    backBtn.titleLabel.shadowColor = [UIColor blackColor];
    backBtn.titleLabel.shadowOffset = CGSizeMake(0, -1);
    backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
    
    [backBtn setTitle:btnTitle?btnTitle:NSLocalizedString(@"Back", nil) forState:UIControlStateNormal];
    
    if (action) {
        [backBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }else{
        [backBtn addTarget:self action:@selector(defaultBackAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
	UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    self.navigationItem.leftBarButtonItem = leftBarBtn;
}

- (void)defaultBackAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
