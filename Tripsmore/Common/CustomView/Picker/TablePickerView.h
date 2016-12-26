//
//  DualPickerOptionViewController.h
//  Speedboy
//
//  Created by TaHoangMinh on 8/13/14.
//  Copyright (c) 2014 Niw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasedPickerViewController.h"

@interface TablePickerView : BasedPickerViewController <UITableViewDelegate, UITableViewDataSource>

@property NSArray *arrDataSource;
@property NSArray *arrIDs;
@property NSArray *arrImages;
@property NSMutableDictionary *dict;
@property CGFloat heightRow;
@end
