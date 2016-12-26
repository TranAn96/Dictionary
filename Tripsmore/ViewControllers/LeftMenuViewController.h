//
//  LeftMenuViewController.h
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "BasedTableViewController.h"

@interface LeftMenuViewController : BasedTableViewController <UITableViewDelegate,UITableViewDataSource>

@property NSInteger previousRow;
- (void) refreshColor;
+ (LeftMenuViewController *)shareInstance;


@end
