//
//  ImportViewController.h
//  Tripsmore
//
//  Created by Trần An on 12/9/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "TranslateDetailViewController.h"

@interface ImportViewController : TranslateDetailViewController
@property (weak, nonatomic) IBOutlet UIButton *btnMenu;
@property (weak, nonatomic) IBOutlet UIButton *btnImport;
- (IBAction)import:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtName;

@end
