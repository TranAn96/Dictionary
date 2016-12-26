//
//  ColorChooserViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "ColorChooserViewController.h"
#import "LeftMenuViewController.h"
#import "AppDelegate.h"
#import "StaticData.h"
#import "SplashViewController.h"
#import "SettingViewController.h"

@interface ColorChooserViewController ()

@end

@implementation ColorChooserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LocalizedString(@"Color Theme Chooser");
    self.arrColorName = @[@"Red",
                          @"Pink",
                          @"Purple",
                          @"Deep Purple",
                          @"Indigo",
                          @"Blue",
                          @"Light Blue",
                          @"Cyan",
                          @"Teal",
                          @"Green",
                          @"Light Green",
                          @"Lime",
                          @"Amber",
                          @"Orange",
                          @"Deep Orange",
                          @"Blue Grey",
                          @"Brown",
                          @"Black"];
    self.arrColorValue = @[@"#F44336",
                           @"#EC407A",
                           @"#9C27B0",
                           @"#673AB7",
                           @"#3F51B5",
                           @"#2196F3",
                           @"#03A9F4",
                           @"#00BCD4",
                           @"#009688",
                           @"#4CAF50",
                           @"#8BC34A",
                           @"#CDDC39",
                           @"#FFC107",
                           @"#FF9800",
                           @"#FF5722",
                           @"#795548",
                           @"#607DBB",
                           @"#000000"];
    
    self.numberRowInSection = @{@(0): @(self.arrColorName.count)};
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIView *viewColor = (UIView *)[cell.contentView viewWithTag:101];
    UILabel *lblText = (UILabel *)[cell.contentView viewWithTag:102];
    
    lblText.text = self.arrColorName[indexPath.row];
    viewColor.backgroundColor = [Utils colorFromHex:self.arrColorValue[indexPath.row]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strColor = self.arrColorValue[indexPath.row];
    [[NSUserDefaults standardUserDefaults] setObject:strColor forKey:kUD_MainColor];
    
    [[NSUserDefaults standardUserDefaults] synchronize];

    [StaticData sharedInstance].mainColor = [Utils colorFromHex:strColor];
    [[LeftMenuViewController shareInstance] refreshColor];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
