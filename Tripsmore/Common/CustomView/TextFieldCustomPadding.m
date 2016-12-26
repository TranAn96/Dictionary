//
//  DualCustomTextField.m
//  Recipe
//
//  Created by TaHoangMinh on 11/16/13.
//  Copyright (c) 2013 Niw. All rights reserved.
//

#import "TextFieldCustomPadding.h"

@implementation TextFieldCustomPadding

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.paddingRight = kTextFieldPaddingDefault;
        self.paddingLeft = kTextFieldPaddingDefault;
        self.backgroundColor = [UIColor clearColor];
        self.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    }
    return self;
}

- (void) layoutSubviews{
    [super layoutSubviews];
    if ([@"line_view" isEqualToString:self.style]) {
        if (self.viewLine == nil) {
            self.borderStyle = UITextBorderStyleNone;
            self.viewLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1)];
            self.viewLine.backgroundColor = kTextFieldLineColor;
            [self insertSubview:self.viewLine atIndex:0];
        }
    } else {
       // do nothing
        self.layer.borderColor = kColorGray.CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 3.0f;
    }
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    CGRect inset = CGRectMake(bounds.origin.x + self.paddingLeft, bounds.origin.y, bounds.size.width - self.paddingRight - self.paddingLeft, bounds.size.height);
    return inset;
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    CGRect inset = CGRectMake(bounds.origin.x + self.paddingLeft, bounds.origin.y, bounds.size.width - self.paddingRight - self.paddingLeft, bounds.size.height);
    return inset;
}

- (void)setValue:(id)value forKeyPath:(NSString *)keyPath
{
    if ([keyPath isEqualToString:k_view_style]) {
        self.style = value;
    }
}
@end
