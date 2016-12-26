//
//  FavouriteViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "FavouriteViewController.h"
#import "TranslateDetailViewController.h"

@interface FavouriteViewController ()

@end

@implementation FavouriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LocalizedString(@"Favourites");
    [self.view addGestureRecognizer:[SWRevealViewController shareInstance].panGestureRecognizer];
    [self refreshData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshData];
}

- (void) refreshData
{
    NSArray *arrEng2Pa = [[DatabaseService shareInstance] listWordFavouriteIsEng2Pa:YES];
    NSArray *arrPa2Eng = [[DatabaseService shareInstance] listWordFavouriteIsEng2Pa:NO];
    self.tableData = [arrEng2Pa arrayByAddingObjectsFromArray:arrPa2Eng];
    self.numberRowInSection = @{@(0): @(self.tableData.count)};
    [self.tableView reloadData];
}
- (void)backAction:(id)sender
{
    [[SWRevealViewController shareInstance] revealToggle:self.btnBack];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    UILabel *lbl1 = (UILabel *)[cell.contentView viewWithTag:101];
    UILabel *lbl2 = (UILabel *)[cell.contentView viewWithTag:102];
    
    Words *word = self.tableData[indexPath.row];
    lbl1.text = word.word;
    lbl2.text = word.result;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Words *word = self.tableData[indexPath.row];
    TranslateDetailViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"TranslateDetailViewController"];
    vc.word = word;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
