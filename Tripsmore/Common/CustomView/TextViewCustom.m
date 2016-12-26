//
//  TextViewCustom.m
//  Speedboy
//
//  Created by Minh Ta Hoang on 7/29/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import "TextViewCustom.h"

@implementation TextViewCustom
#define kTextViewPaddingDefault 6
#define kColorTextPlaceHolder [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0f]

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.paddingLeft = kTextViewPaddingDefault;
        self.paddingRight = kTextViewPaddingDefault;
        
        self.lblPlaceHolder = [[UILabel alloc] initWithFrame:CGRectMake(self.paddingLeft + 4, self.paddingLeft, self.frame.size.width, 20)];
        self.lblPlaceHolder.font = self.font;
        self.lblPlaceHolder.textColor = kColorTextPlaceHolder;
        self.lblPlaceHolder.text = @"Place holder";
        
        self.lblNumberOfCharacter = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 100, self.frame.size.height - 30, 95, 30)];
        self.lblNumberOfCharacter.font = self.font;
        self.lblNumberOfCharacter.textColor = kColorTextPlaceHolder;
        self.lblNumberOfCharacter.text = @"";
        self.lblNumberOfCharacter.textAlignment = NSTextAlignmentRight;
        
        self.layer.borderColor = kColorLightGray.CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 3.0f;
        [self addSubview:self.lblPlaceHolder];
        [self addSubview:self.lblNumberOfCharacter];
        self.autocapitalizationType = UITextAutocapitalizationTypeSentences;
        self.textContainerInset = UIEdgeInsetsMake(self.paddingLeft, self.paddingLeft, 0, self.paddingRight);
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.numberOfMaximumCharacter == 0) {
        self.lblNumberOfCharacter.hidden = YES;
    } else {
        self.lblNumberOfCharacter.hidden = NO;
        self.lblNumberOfCharacter.text = [NSString stringWithFormat:@"%d/%d", (int)SAFE_STR(self.text).length, self.numberOfMaximumCharacter];
    }
    [self.superview addSubview:self.lblNumberOfCharacter];
    self.lblNumberOfCharacter.frame = CGRectMake(self.frame.origin.x + self.frame.size.width - 100, self.frame.origin.y + self.frame.size.height - 30, 95, 30);
}

- (void)setPlaceholder:(NSString *)placeHolder
{
    _placeholder = placeHolder;
    self.lblPlaceHolder.text = placeHolder;
}

- (void) handleTextChange;
{
    if (self.text == nil || self.text.length == 0) {
        self.lblPlaceHolder.hidden = NO;
    } else {
        self.lblPlaceHolder.hidden = YES;
    }
    
    // show maximum character
    if (self.numberOfMaximumCharacter != 0) {
        self.lblNumberOfCharacter.text = [NSString stringWithFormat:@"%d/%d", (int)SAFE_STR(self.text).length, self.numberOfMaximumCharacter];
    }
}

- (BOOL)shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
{
    // Prevent crashing undo bug – see note below.
    if (self.numberOfMaximumCharacter == 0) {
        return YES;
    }
    if (range.length + range.location > self.numberOfMaximumCharacter) {
        return NO;
    }
    
    NSUInteger newLength = [self.text length] + [text length] - range.length;
    return newLength <= self.numberOfMaximumCharacter;
}
@end
