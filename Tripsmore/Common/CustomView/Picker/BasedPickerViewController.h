//
//  BasedPickerViewController.h
//  Speedboy
//
//  Created by Minh Ta Hoang on 7/11/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum
{
    DUALPICKERVIEW_TYPE_SINGLE_SELECTION = 0,
    DUALPICKERVIEW_TYPE_MULTIPLE_SELECTION = 1
} DUALPICKERVIEW_TYPE;

typedef enum
{
    DUALPICKERVIEW_DISPLAY_TYPE_SUBVIEW = 0,
    DUALPICKERVIEW_DISPLAY_TYPE_PUSH = 1
} DUALPICKERVIEW_DISPLAY_TYPE;

typedef enum
{
    DUALPICKERVIEW_DISPLAY_POSITION_CENTER = 0,
    DUALPICKERVIEW_DISPLAY_POSITION_BOTTOM = 1
} DUALPICKERVIEW_DISPLAY_POSITION;

@interface BasedPickerViewController : UIViewController
{
    void(^ _chooseDataBlock)(NSString *chosenData);
}

@property UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;
@property (weak, nonatomic) IBOutlet UIButton *btnOk;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property NSString *chosenData;
@property UILabel *lblTitle;

@property float viewHeight;
@property (weak, nonatomic) IBOutlet id dataTable;

@property DUALPICKERVIEW_TYPE selectionType;
@property DUALPICKERVIEW_DISPLAY_TYPE displayType;
@property DUALPICKERVIEW_DISPLAY_POSITION displayPosition;

- (void) setCompletionBlock:(void(^)(NSString *chosenData)) chooseDataBlock;
- (void) showInView:(UIViewController *) vc type:(DUALPICKERVIEW_DISPLAY_TYPE)type position:(DUALPICKERVIEW_DISPLAY_POSITION) position;
- (float) getDataSourceViewHeight;
- (void) hide;
- (IBAction)btnBackClicked:(id)sender;

- (IBAction)btnCancel:(id)sender;
- (IBAction)btnOkClicked:(id)sender;
- (void) refreshDataWithChosen:(NSString *)strChoosenData;

@property (weak, nonatomic) IBOutlet UILabel *lblContent;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
