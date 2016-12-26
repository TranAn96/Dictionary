//
//  BasePopUpViewController.m
//  Nushi
//
//  Created by Ta Hoang Minh on 3/9/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import "BasePopUpViewController.h"
@interface BasePopUpViewController ()
@property (nonatomic, strong) void (^compleHandler)(id object, NSInteger index);
@end

@implementation BasePopUpViewController
static id instance;
- (void)viewDidLoad {
    [super viewDidLoad];
    instance = self;
    [Utils setCornerRadiusView:self.viewContainContent withCornerRadius:5];
    [self configurePopUpView];
}

#pragma mark CONFIGUTION_POPUP
- (void)configurePopUpView;
{
    if (self.backgroundView == nil) {
        UIView *containerView = self.viewContainContent;
        if (containerView != nil) {
            self.view.backgroundColor = [UIColor clearColor];
            self.toolbarView = [[UIToolbar alloc] initWithFrame:[self frameOfBackground]];
            self.backgroundView = [[UIView alloc] initWithFrame:[self frameOfBackground]];
            self.toolbarView.alpha = [self blurOfBackground];
            self.toolbarView.tintColor = [UIColor blackColor];
            self.backgroundView.alpha = [self alphaOfBackground];
            self.backgroundView.backgroundColor = [UIColor blackColor];
            [[containerView superview] insertSubview:self.backgroundView belowSubview:containerView];
            [[containerView superview] insertSubview:self.toolbarView belowSubview:self.backgroundView];
            
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundViewClicked:)];
            [self.backgroundView addGestureRecognizer:tapGesture];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showTopWindow
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.view];
}
-(void)setCompletionBlock:(void (^)(id, NSInteger))completeBlock
{
    _compleHandler = completeBlock;    
}
-(IBAction)btnControlPopupClicked:(UIButton *)sender;
{
    if (_compleHandler != nil) {
        _compleHandler(self, sender.tag);
    }
}
-(IBAction)btnExitClicked:(id)sender;
{
    [self.view removeFromSuperview];
    
}

-(void)backgroundViewClicked:(id)sender
{
    if (_compleHandler != nil) {
        _compleHandler(self, kTagClickBackground);
    }
    [self.view removeFromSuperview];
}
- (CGFloat) blurOfBackground
{
    return 0.65f;
}

- (CGFloat) alphaOfBackground
{
    return 0.5;
}

- (CGRect) frameOfBackground;
{
    return self.view.frame;
}

@end
