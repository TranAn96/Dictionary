//
//  AddWordViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "AddWordViewController.h"
#import "StaticData.h"

@interface AddWordViewController ()

@end

@implementation AddWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.word == nil) {
        [self.view addGestureRecognizer:[SWRevealViewController shareInstance].panGestureRecognizer];
    } else {
        self.tfWord.text = self.word.word;
        self.tfTranslate.text = self.word.result;
        self.tfDes.text = self.word.strDescription;
        self.tfTranlite.text = _word.translitetation;
    }
    self.title = LocalizedString(@"Add Word");
    self.btnSave.backgroundColor =[StaticData sharedInstance].mainColor;
    self.btnClear.backgroundColor =[StaticData sharedInstance].mainColor;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return  YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)backAction:(id)sender
{
    if (self.word == nil) {
        [[SWRevealViewController shareInstance] revealToggle:self.btnBack];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClearClicked:(id)sender {
    self.tfTranslate.text = @"";
    self.tfWord.text = @"";
    self.tfTranlite.text = @"";
    self.tfDes.text = @"";
}
- (IBAction)btnSaveClicked:(id)sender {
    Words *word = [[Words alloc] init];
    if (self.word != nil) {
        word = self.word;
    }
    word.word = self.tfWord.text;
    word.result = self.tfTranslate.text;
    word.strDescription = self.tfDes.text;
    word.isEng2Pa = self.isEng2Pa;
    if (self.word == nil) {
        BOOL result = [[DatabaseService shareInstance] insert:word changeEditTime:YES];
        if (result) {
            self.tfTranslate.text = @"";
            self.tfWord.text = @"";
            self.tfTranlite.text = @"";
            self.tfDes.text = @"";
            [self.view makeToast:LocalizedString(@"Inserted word successfully") duration:2.0 position:nil];
        } else {
            [self.view makeToast:LocalizedString(@"Inserted word failed!") duration:2.0 position:nil];
        }
    } else {
        BOOL result = [[DatabaseService shareInstance] update:word changeEditTime:YES];
        if (result) {
            [self.view makeToast:LocalizedString(@"Updated word successfully") duration:2.0 position:nil];
        } else {
            [self.view makeToast:LocalizedString(@"Updated word failed!") duration:2.0 position:nil];
            
        }
    }
}
@end
