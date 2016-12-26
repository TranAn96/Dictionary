//
//  BasedViewController.h
//  Mosavik
//
//  Created by TaHoangMinh on 7/18/14.
//  Copyright (c) 2014 niw. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kTagCustomNavi 10001
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <iAd/iAd.h>

@interface BasedViewController : UIViewController <UIActionSheetDelegate>
@property UIToolbar *toolbarView;
@property UIView *backgroundView;
@property (nonatomic, assign) BOOL isDisablePanGeuture;
@property (weak, nonatomic) IBOutlet UIView *customNavigation;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property NSString *strTitle;

// ADS
@property (weak, nonatomic) IBOutlet GADBannerView *adsView;
@property ADBannerView *iAdView;
@property(nonatomic, strong) GADInterstitial *interstitial;


-(void)localizableViewControl;
-(void)fillDataInitForView;
- (void)thankNews:(id)news;
- (void)shareNews:(id)news;
-(IBAction)backAction:(id)sender;
- (void) handleShareNewsSuccessfully:(id)sharedNews;
- (void) handleThankNewsSuccessfully:(id)sharedNews;
- (void) customNavigationBar;

///////// LOGIC OF APP
@property (weak, nonatomic) IBOutlet UIButton *btnEdit;
- (IBAction)btnEditClicked:(id)sender;

@end
