//
//  TranslateViewController.h
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "BasedTableViewController.h"

@interface TranslateViewController : BasedTableViewController
@property (weak, nonatomic) IBOutlet UIView *viewInput;

@property (weak, nonatomic) IBOutlet UIButton *btnEng2Pa;
- (IBAction)btnEng2PaClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnPa2Eng;
- (IBAction)btnPa2EngClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnVnEng;
- (IBAction)btnVnEngTouch:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnVnFre;
- (IBAction)btnVnFreTouch:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *tfInput;
@property (weak, nonatomic) IBOutlet UITableView *tblView;

@property (weak, nonatomic) IBOutlet UIButton *btnClear;
- (IBAction)btnClearClicked:(id)sender;

@property BOOL isEng2Pa;
@property BOOL isPa2Eng;
@property BOOL isVN2Pa;

@property (weak, nonatomic) IBOutlet UIView *viewLine;

@end
