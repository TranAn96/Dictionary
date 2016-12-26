//
//  TextViewCustom.h
//  Speedboy
//
//  Created by Minh Ta Hoang on 7/29/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewCustom : UITextView

@property (nonatomic) NSString *placeholder;
@property UILabel *lblPlaceHolder;
@property UILabel *lblNumberOfCharacter;
@property (nonatomic, assign) int paddingLeft;
@property (nonatomic, assign) int paddingRight;

@property int numberOfMaximumCharacter;

- (void) handleTextChange;
- (BOOL) shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;

@end
