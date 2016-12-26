//
//  BasedTableViewController.h
//  Speedboy
//
//  Created by Ta Hoang Minh on 6/27/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasedTableViewController : BasedTextInputScrollViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) NSDictionary *numberRowInSection;
@property (nonatomic, strong) NSArray *tableData;



@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
