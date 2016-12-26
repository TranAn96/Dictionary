//
//  BasedPickerViewController.m
//  Speedboy
//
//  Created by Minh Ta Hoang on 7/11/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import "BasedPickerViewController.h"

@interface BasedPickerViewController ()

@end

@implementation BasedPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showInView:(UIViewController *) vc type:(DUALPICKERVIEW_DISPLAY_TYPE)type position:(DUALPICKERVIEW_DISPLAY_POSITION) position;
{
    self.displayType = type;
    self.displayPosition = position;
    if (type == DUALPICKERVIEW_DISPLAY_TYPE_PUSH) {
        [vc.navigationController pushViewController:self animated:YES];
    } else {
        [vc.view addSubview:self.view];
        self.view.frame = CGRectMake(0,
                                     0,
                                     vc.view.frame.size.width,
                                     vc.view.frame.size.height);
        self.lblContent.text = self.title;
        // add button Cancel
        [self.btnCancel setTitle:@"Cancel" forState:UIControlStateNormal];
        [self.btnCancel addTarget:self action:@selector(btnCancelClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.btnOk setTitle:LocalizedString(@"OK") forState:UIControlStateNormal];
        [self.btnOk addTarget:self action:@selector(btnOkClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        // add table picker
        self.viewHeight = [self getDataSourceViewHeight];
        [Utils setHeightView:self.contentView height:self.viewHeight];
        
        if (position == DUALPICKERVIEW_DISPLAY_POSITION_CENTER) {
            self.contentView.center = self.view.center;
        } else if (position == DUALPICKERVIEW_DISPLAY_POSITION_BOTTOM) {
            [Utils setYView:self.contentView height:self.view.frame.size.height - self.contentView.frame.size.height - 44];
        }
        
        // add background
        self.backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
        self.backgroundView.backgroundColor = [UIColor blackColor];
        self.backgroundView.alpha = 0.6;
        [self.view insertSubview:self.backgroundView atIndex:0];
        
        // animation
        CGRect tableRect = self.contentView.frame;
        self.contentView.frame = CGRectMake(0, self.view.frame.size.height + self.contentView.frame.size.height, tableRect.size.width, tableRect.size.height);
        self.backgroundView.alpha = 0.0f;
        [UIView animateWithDuration:0.4f animations:^{
            self.backgroundView.alpha = 0.6f;
            self.contentView.frame = tableRect;
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped:)];
        [self.backgroundView addGestureRecognizer:tap];
    }
}

- (float) getDataSourceViewHeight;
{
    return self.contentView.frame.size.height;
}


- (IBAction)btnCancel:(id)sender {
    
}

- (IBAction)btnOkClicked:(id)sender {
    if (_chooseDataBlock != nil) {
        _chooseDataBlock(self.chosenData);
    }
    [self hide];
}

- (void) hide;
{
    self.backgroundView.hidden = YES;
    [UIView animateWithDuration:0.4f animations:^{
        self.contentView.frame = CGRectMake(0, self.view.frame.size.height + self.contentView.frame.size.height, self.contentView.frame.size.width,
                                                      self.contentView.frame.size.height);
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
}

- (void) backgroundTapped:(UITapGestureRecognizer *)gesture
{
    if (self.displayType == DUALPICKERVIEW_DISPLAY_TYPE_SUBVIEW) {
        [self hide];
        _chooseDataBlock(nil);
    }
}

- (void) btnCancelClicked:(UIButton *)btn
{
    if (self.displayType == DUALPICKERVIEW_DISPLAY_TYPE_SUBVIEW) {
        [self hide];
        _chooseDataBlock(nil);
    }
}

- (void) refreshDataWithChosen:(NSString *)strChoosenData;
{
    
}

- (void) setCompletionBlock:(void(^)(NSString *chosenData)) chooseDataBlock
{
    _chooseDataBlock = chooseDataBlock;
}

- (IBAction)btnBackClicked:(id)sender;
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
