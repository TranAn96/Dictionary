//
//  SettingViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "SettingViewController.h"
#import "ColorChooserViewController.h"
#import "IAPHelper.h"
#import "RageIAPHelper.h"
#import "DatabaseService.h"
#import "StaticData.h"

@interface SettingViewController ()

@end

@implementation SettingViewController
static id instance = nil;
+ (SettingViewController *)shareInstance;
{
    return instance;
}
- (void) refreshColor;
{
    self.btnThemeColor.backgroundColor = [StaticData sharedInstance].mainColor;
    self.btnReset.backgroundColor = [StaticData sharedInstance].mainColor;
    self.btnAbout.backgroundColor = [StaticData sharedInstance].mainColor;;
    self.btnRemoveAds.backgroundColor = [StaticData sharedInstance].mainColor;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LocalizedString(@"Setting");
    [self.view addGestureRecognizer:[SWRevealViewController shareInstance].panGestureRecognizer];
    [self refreshButtons];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshButtons) name:IAPHelperProductPurchasedNotification object:nil];
    self.btnThemeColor.backgroundColor = [StaticData sharedInstance].mainColor;
    self.btnReset.backgroundColor = [StaticData sharedInstance].mainColor;
    self.btnAbout.backgroundColor = [StaticData sharedInstance].mainColor;;
    self.btnRemoveAds.backgroundColor = [StaticData sharedInstance].mainColor;
}

- (void)backAction:(id)sender
{
    [[SWRevealViewController shareInstance] revealToggle:self.btnBack];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnThemeColorClicked:(id)sender {
    ColorChooserViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"ColorChooserViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)btnResetDataClicked:(id)sender {
    UIAlertView *alertDelete = [[UIAlertView alloc]initWithTitle:@"Do you want to reset all data?" message:nil delegate:self  cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [alertDelete show];
    NSLog(@"Reset");
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{if (buttonIndex == 1) {
    DatabaseService *anhAn = [[DatabaseService alloc]init];
    [anhAn resetDB];
}
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnAboutClicked:(id)sender {
    UIAlertView *alertDelete = [[UIAlertView alloc]initWithTitle:@"Ứng dụng từ điển thông minh cho thiết bị iOS." message:nil delegate:self  cancelButtonTitle:@"OK" otherButtonTitles : nil];
    [alertDelete show];
    NSLog(@"About");
}
- (IBAction)btnRemoveAdsClicked:(id)sender {
    [self buyItem:kIAP_removeads];
}
- (IBAction)btnReloadClicekd:(id)sender {
    [[RageIAPHelper sharedInstance] restoreCompletedTransactions];
}

- (void) refreshButtons
{
    BOOL purchased = [[NSUserDefaults standardUserDefaults] boolForKey:kIAP_removeads];
    if (purchased) {
        self.btnRemoveAds.enabled = NO;
        [self.adsView removeFromSuperview];
        [self.iAdView removeFromSuperview];
    } else {
        self.btnRemoveAds.enabled = YES;
    }
}
- (void) buyItem:(NSString *)strItem
{
    if([[RageIAPHelper sharedInstance] productPurchased:strItem])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:IAPHelperProductPurchasedNotification object:nil userInfo:nil];
    }
    else
    {
        [[RageIAPHelper sharedInstance] requestProductsWithCompletionHandler:^(BOOL success, NSArray * products)
         {
             if (success)
             {
                 if (products.count > 0) {
                     for (SKProduct *productBuy in products) {
                         if ([productBuy.productIdentifier isEqualToString:strItem]) {
                             [[RageIAPHelper sharedInstance] buyProduct:productBuy];
                         }
                     }
                 } else {
                     [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Can not find product" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
                 }
             } else {
                 [[[UIAlertView alloc] initWithTitle:@"Error" message:@"There's error, please try again later!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
             }
         }];
    }
}

@end
