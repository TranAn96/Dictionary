//
//  BasePopUpViewController.h
//  Nushi
//
//  Created by Ta Hoang Minh on 3/9/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasedViewController.h"
#define kTagClickBackground 10001
@interface BasePopUpViewController : BasedViewController
@property (weak, nonatomic) IBOutlet UIView *viewContainContent;
-(IBAction)btnControlPopupClicked:(UIButton *)sender;
-(IBAction)btnExitClicked:(id)sender;

//POPUP
- (CGFloat)blurOfBackground;
- (CGFloat)alphaOfBackground;
-(void) backgroundViewClicked:(id)sender;
-(void)setCompletionBlock:(void(^)(id popUpVC, NSInteger index)) completeBlock;
-(void)showTopWindow;
@end
