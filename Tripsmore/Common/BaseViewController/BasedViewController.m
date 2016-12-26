//
//  BasedViewController.m
//  Mosavik
//
//  Created by TaHoangMinh on 7/18/14.
//  Copyright (c) 2014 niw. All rights reserved.
//

#import "BasedViewController.h"
#import "APIService.h"
#import "IAPHelper.h"
#import "AppDelegate.h"

@interface BasedViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BasedViewController

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
    [self fillDataInitForView];
    [self localizableViewControl];
    if (self.navigationItem != nil) {
        self.navigationItem.hidesBackButton = YES;
    }
    // fix bug swipe left to back view
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
    
    //// CONFIGURE IADS
//    if (self.adsView != nil) {
//        self.iAdView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, self.adsView.frame.origin.y, self.view.frame.size.width, self.adsView.frame.size.height)];
//    }
    /// END CONFIGURE IADS
    
    //// CONFIGURE INTERESTIAL
//    if (self.adsView != nil) {
//        self.interstitial = [[GADInterstitial alloc] initWithAdUnitID:kAdmodInterestial];
//        GADRequest *request = [GADRequest request];
//        [self.interstitial loadRequest:request];
//    }
    ///// END CONFIGURE INTERESTIAL
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return NO;
}
- (void)setTitle:(NSString *)title
{
    [super setTitle:@""];
    self.strTitle = title;
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"--> GO TO VIEW: %@ ID: %@", [self.class description], self.restorationIdentifier);
    NSString *keyScreen = [self.class description];
    NSString *valueShowScreen = [StaticData sharedInstance].screenMap[keyScreen];
    [self customNavigationBar];
    [self localizableViewControl];
    if(!self.isDisablePanGeuture){
        
    }
//    [self.btnBack setImage:[UIImage imageNamed:@"btn_back"] forState: UIControlStateNormal];
    self.customNavigation.clipsToBounds = YES;
    
    // load Ads
    if (![[NSUserDefaults standardUserDefaults] boolForKey:kIAP_removeads]) {
        ///// GOOGLE ADMOD
//        if (self.adsView != nil) {
//            NSLog(@"Google Mobile Ads SDK version: %@", [GADRequest sdkVersion]);
//            self.adsView.adUnitID = kAdmod;
//            self.adsView.rootViewController = self;
//            self.adsView.adSize = kGADAdSizeSmartBannerPortrait;
//            CGSize size = CGSizeFromGADAdSize(kGADAdSizeSmartBannerPortrait);
//            self.adsView.frame = CGRectMake(self.view.frame.size.width / 2 - size.width / 2,
//                                            self.view.frame.size.height - size.height,
//                                            size.width,
//                                            size.height);
//            GADRequest *request = [GADRequest request];
//            [self.adsView loadRequest:request];
//            request.testDevices = @[ @"a9fa978421203b80786d279f95127bc5" ];
//        }
        
        ///// iADs
        if (self.iAdView != nil) {
            [self.view addSubview:self.iAdView];
        }
        
//        ///// INTERESTIAL
//        if (self.interstitial && [self.interstitial isReady] /*&& (rand() % 3) == 0*/) {
//            [self.interstitial presentFromRootViewController:self];
//        }
    } else {
        [self.adsView removeFromSuperview];
        [self.iAdView removeFromSuperview];
    }
}

- (BOOL)hidesBottomBarWhenPushed {
    return YES;
}

- (void) customNavigationBar
{
//    for (UIView *subView in self.navigationController.navigationBar.subviews) {
//        subView.hidden = YES;
//    }
    if (self.navigationController != nil && self.customNavigation != nil) {
        self.navigationController.navigationBarHidden = NO;
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
        self.customNavigation.tag = kTagCustomNavi;
        self.customNavigation.backgroundColor = [StaticData sharedInstance].mainColor;
        self.customNavigation.userInteractionEnabled = YES;
        
        self.customNavigation.translatesAutoresizingMaskIntoConstraints = YES;
        self.customNavigation.frame = CGRectMake(0, -20, self.view.frame.size.width, self.customNavigation.frame.size.height);
        self.customNavigation.hidden = NO;
        
        self.customNavigation.layer.masksToBounds = NO;
        self.customNavigation.layer.shadowColor = kColorGray.CGColor;
        self.customNavigation.layer.shadowOffset = CGSizeMake(2, 2);
        self.customNavigation.layer.shadowRadius = 2;
        self.customNavigation.layer.shadowOpacity = 1.0;
        
        if (![self.customNavigation viewWithTag:101]) {
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                       self.customNavigation.frame.size.height - 2, self.customNavigation.frame.size.width,
                                                                        2)];
            lineView.tag = 101;
            [self.customNavigation addSubview:lineView];
        }
        
        [self.navigationController.navigationBar addSubview:self.customNavigation];
        self.lblTitle.text = self.strTitle;
        self.lblTitle.textAlignment = NSTextAlignmentCenter;
        self.lblTitle.textColor = kColorWhite;
        self.lblTitle.font = [UIFont fontWithName:kFontHelveticaMedium size:18];
        self.lblTitle.center = CGPointMake(self.customNavigation.frame.size.width / 2, self.customNavigation.frame.size.height / 2 + 7);
    }
}

- (IBAction)btnEditClicked:(id)sender {
    UIActionSheet *actionsheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:LocalizedString(@"Cancel") destructiveButtonTitle:nil otherButtonTitles:LocalizedString(@"Setting"), nil];
    actionsheet.tag = 1001;
    [actionsheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        // do nothing
    } else if (buttonIndex == 1) {
        
    } else if (buttonIndex == 2) {
        NSLog(@"Delete");
    }
}


-(void)fillDataInitForView
{
    return;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)localizableViewControl
{
    return;
}

-(IBAction)backAction:(id)sender;
{
    if (!self.navigationController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)isModalPresent {
//    if([self presentingViewController])
//        return YES;
//    if([[self presentingViewController] presentedViewController] == self)
//        return YES;
//    if([[[self navigationController] presentingViewController] presentedViewController] == [self navigationController])
//        return YES;
//    if([[[self tabBarController] presentingViewController] isKindOfClass:[UITabBarController class]])
//        return YES;
//    
    return NO;
}

@end
