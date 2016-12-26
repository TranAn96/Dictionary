//
//  DatePicker.m
//  Speedboy
//
//  Created by Minh Ta Hoang on 7/11/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import "DatePicker.h"

@interface DatePicker ()

@end

@implementation DatePicker

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) datePickerChanged:(UIDatePicker *)datePicker
{
    NSLog(@"Start");
    self.chosenData = [[Utils dateFormatterDateOnly] stringFromDate:datePicker.date];
}

- (void) refreshDataWithChosen:(NSString *)strChoosenData;
{
    if (!(strChoosenData == nil || strChoosenData.length < 4)) {
        NSDate *date = [[Utils dateFormatterDateOnly] dateFromString:strChoosenData];
        [(UIDatePicker *)(self.dataTable) setDate:date];
    }
}
- (void)showInView:(UIViewController *)vc type:(DUALPICKERVIEW_DISPLAY_TYPE)type position:(DUALPICKERVIEW_DISPLAY_POSITION)position
{
    [super showInView:vc type:type position:position];
    UIDatePicker*picker = (UIDatePicker *)(self.dataTable);
    NSDate *currentDate = [NSDate date];
    [picker setMaximumDate:currentDate];
}
@end
