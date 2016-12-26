//
//  AddWordViewController.h
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "BasedTableViewController.h"
#import "TranslateViewController.h"

@interface AddWordViewController : TranslateViewController

@property (weak, nonatomic) IBOutlet UITextField *tfWord;
@property (weak, nonatomic) IBOutlet UITextField *tfTranslate;
@property (weak, nonatomic) IBOutlet UITextField *tfDes;
@property (weak, nonatomic) IBOutlet UITextField *tfTranlite;

@property Words *word;

@property (weak, nonatomic) IBOutlet UIButton *btnSave;


@end
