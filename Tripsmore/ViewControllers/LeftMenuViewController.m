//
//  LeftMenuViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "TranslateViewController.h"
#import "FavouriteViewController.h"
#import "AddWordViewController.h"
#import "SettingViewController.h"
#import "AboutViewController.h"
#import "BaseTableViewCell.h"

@interface LeftMenuViewController ()

@end

@implementation LeftMenuViewController

static id instance = nil;
+ (LeftMenuViewController *)shareInstance;
{
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    instance = self;
    // Do any additional setup after loading the view.
    self.customNavigation.backgroundColor = [StaticData sharedInstance].mainColor;
}

- (void) refreshColor;
{
    self.customNavigation.backgroundColor = [StaticData sharedInstance].mainColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

//    UIImageView *img = (UIImageView *)[cell.contentView viewWithTag:101];
//    UILabel *lblTitle = (UILabel *)[cell.contentView viewWithTag:102];
//    UILabel *lblNum = (UILabel *)[cell.contentView viewWithTag:103];
    cell.lblNum.layer.cornerRadius = 1.0f;
    cell.lblNum.hidden = YES;
    
    if (indexPath.row == 0) {
        cell.img.image = [UIImage imageNamed:@"ic_translate.png"];
        cell.lblTitle.text = LocalizedString(@"Translate");
    } else if (indexPath.row == 1) {
        cell.img.image = [UIImage imageNamed:@"ic_favorites.png"];
        cell.lblTitle.text = LocalizedString(@"Favourites");
    } else if (indexPath.row == 2) {
        cell.img.image = [UIImage imageNamed:@"ic_add.png"];
        cell.lblTitle.text = LocalizedString(@"Add Word");
    } else if (indexPath.row == 3) {
        cell.img.image = [UIImage imageNamed:@"ic_setting.png"];
        cell.lblTitle.text = LocalizedString(@"Setting");
    } else if (indexPath.row == 4) {
        cell.img.image = [UIImage imageNamed:@"ic_about.png"];
        cell.lblTitle.text = LocalizedString(@"About");
    }else if (indexPath.row == 5) {
        cell.img.image = [UIImage imageNamed:@"ic_about.png"];
        cell.lblTitle.text = LocalizedString(@"Import");
    }else if (indexPath.row == 6) {
        cell.img.image = [UIImage imageNamed:@"ic_about.png"];
        cell.lblTitle.text = LocalizedString(@"Translate VietNam and More");
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.previousRow == indexPath.row) {
        [[SWRevealViewController shareInstance] revealToggle:nil];
        return;
    }
    if (indexPath.row == 0) {
        UIViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"TranslateNav"];
        [[SWRevealViewController shareInstance] pushFrontViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        UIViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"FavouriteNav"];
        [[SWRevealViewController shareInstance] pushFrontViewController:vc animated:YES];
    } else if (indexPath.row == 2) {
        UIViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"AddWordNav"];
        [[SWRevealViewController shareInstance] pushFrontViewController:vc animated:YES];
    } else if (indexPath.row == 3) {
        UIViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"SettingNav"];
        [[SWRevealViewController shareInstance] pushFrontViewController:vc animated:YES];
    } else if (indexPath.row == 4) {
        UIViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"AboutNav"];
        [[SWRevealViewController shareInstance] pushFrontViewController:vc animated:YES];
    } else if (indexPath.row == 5) {
        UIViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"ImportNav"];
        [[SWRevealViewController shareInstance] pushFrontViewController:vc animated:YES];
    }else if (indexPath.row == 6) {
        UIViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"TranslateMore"];
        [[SWRevealViewController shareInstance] pushFrontViewController:vc animated:YES];
    }
    
    self.previousRow = indexPath.row;
}

@end
