//
//  DualCustomTextField.h
//  Recipe
//
//  Created by TaHoangMinh on 11/16/13.
//  Copyright (c) 2013 Niw. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTextFieldPaddingDefault 10
#define kTextFieldLineColor [UIColor colorWithRed:180.0f/255.0f green:179.0f/255.0f blue:179.0f/255.0f alpha:1.0f]
#define k_view_style @"view_style"

@interface TextFieldCustomPadding : UITextField

@property (nonatomic, assign) int paddingLeft;
@property (nonatomic, assign) int paddingRight;
@property UIView *viewLine;
@property UIImageView *imageBackground;
@property NSString *style;
@property NSString *realValue;

@property int maxLength;
@property int minLength;

@end
