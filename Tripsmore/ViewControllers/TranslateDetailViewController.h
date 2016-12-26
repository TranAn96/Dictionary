//
//  TranslateDetailViewController.h
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "BasedTableViewController.h"

@interface TranslateDetailViewController : BasedTableViewController

@property Words *word;

@property (weak, nonatomic) IBOutlet UILabel *lblWord;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblEdited;
@property (weak, nonatomic) IBOutlet UILabel *lblTranslite;

@property (weak, nonatomic) IBOutlet UIButton *btnFavourite;
- (IBAction)btnFavouriteClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnShare;
- (IBAction)btnShareclicked:(id)sender;

@end
