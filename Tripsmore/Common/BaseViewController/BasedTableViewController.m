//
//  BasedTableViewController.m
//  Speedboy
//
//  Created by Ta Hoang Minh on 6/27/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import "BasedTableViewController.h"

@interface BasedTableViewController ()

@end

@implementation BasedTableViewController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberRow = [[self.numberRowInSection objectForKey:@(section)]integerValue];
    return numberRow;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

@end
