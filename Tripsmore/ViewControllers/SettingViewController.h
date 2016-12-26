//
//  SettingViewController.h
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "BasedTableViewController.h"

@interface SettingViewController : BasedTableViewController

- (IBAction)btnThemeColorClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnThemeColor;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnResetData;
- (IBAction)btnResetDataClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnAbout;
- (IBAction)btnAboutClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnRemoveAds;
- (IBAction)btnRemoveAdsClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnReset;

@property (weak, nonatomic) IBOutlet UIButton *btnReload;
- (IBAction)btnReloadClicekd:(id)sender;

+ (SettingViewController *)shareInstance;
- (void) refreshColor;
@end
