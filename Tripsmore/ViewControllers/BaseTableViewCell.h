//
//  BaseTableViewCell.h
//  Tripsmore
//
//  Created by Tran Tuan An on 7/2/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblNum;

@end
