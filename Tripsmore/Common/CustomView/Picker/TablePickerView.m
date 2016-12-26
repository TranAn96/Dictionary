//
//  DualPickerOptionViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 8/13/14.
//  Copyright (c) 2014 Niw. All rights reserved.
//

#import "TablePickerView.h"

@interface TablePickerView ()
@end

@implementation TablePickerView

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
    // Do any additional setup after loading the view.
    ((UITableView *)self.dataTable).tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.dict = [NSMutableDictionary dictionary];
    self.view.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (float) getDataSourceViewHeight;
{
    float height = 44.0f * self.arrDataSource.count + self.headerView.frame.size.height;
    if (height > 44.0f * 7) {
        height = 44.0f * 7;
    }
    return height;
}

#pragma mark UITableviewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int numberOfRow = (int)self.arrDataSource.count;
    return numberOfRow;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self preventClickTwice:tableView];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.chosenData = self.arrIDs[indexPath.row];
    [((UITableView *)self.dataTable) reloadData];
    _chooseDataBlock(self.chosenData);
    [self hide];
}

- (void)preventClickTwice:(UITableView *)tableView
{
    tableView.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        tableView.userInteractionEnabled = YES;
    });
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kCellIdentifier = @"kCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.tag = indexPath.row + 1000;
    
    int labelX = 20;
    UILabel *lbl = (UILabel *)[cell viewWithTag:100];
    lbl.numberOfLines = 0;
    if (self.arrImages == nil || self.arrImages.count == 0) {
        labelX = 20;
    } else {
        labelX = 80;
        if ([cell viewWithTag:101] == nil) {
            UIButton *imgViewTmp = [[UIButton alloc] initWithFrame:CGRectMake(20, 11, 22, 22)];
            imgViewTmp.tag = 101;
            [cell addSubview:imgViewTmp];
        }
    }
    
    if (lbl == nil) {
        lbl = [[UILabel alloc] initWithFrame:CGRectMake(labelX, 0, tableView.frame.size.width - 20 * 2, cell.frame.size.height)];
        if (labelX == 20) {
            lbl.textAlignment = NSTextAlignmentCenter;
        } else {
            lbl.textAlignment = NSTextAlignmentLeft;
        }
        lbl.tag = 100;
        [cell addSubview:lbl];
    }
    
    lbl.text = self.arrDataSource[indexPath.row];
    lbl.textColor = [UIColor blackColor];
    
    NSString *keySelected = self.arrIDs[indexPath.row];
    if (self.chosenData != nil && [self.chosenData isEqualToString:keySelected]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.accessoryView.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.heightRow != 0) {
        [lbl setNumberOfLines:0];
       lbl.textAlignment = NSTextAlignmentLeft;
       lbl.frame = CGRectMake(10, 0, tableView.frame.size.width - 25 * 2, self.heightRow);
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.heightRow != 0) {
        return self.heightRow;
    }
    return 44;
}
@end
