//
//  TextFieldCustom.m
//  Speedboy
//
//  Created by Minh Ta Hoang on 8/18/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import "TextFieldCustom.h"

@implementation TextFieldCustom

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.lblValueSugession = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 100, self.frame.size.height - 30, 95, 30)];
        self.lblValueSugession.font = self.font;
        self.lblValueSugession.textColor = kColorGray;
        self.lblValueSugession.text = @"";
        self.lblValueSugession.textAlignment = NSTextAlignmentRight;
        
        [self addSubview:self.lblValueSugession];
        self.lblValueSugession.hidden = self.hidden;
    }
    return self;
}

- (void)setHidden:(BOOL)hidden
{
    [super setHidden:hidden];
    self.lblValueSugession.hidden = hidden;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.superview addSubview:self.lblValueSugession];
    self.lblValueSugession.text = self.strValueSuggession;
    self.lblValueSugession.frame = CGRectMake(self.frame.origin.x + self.frame.size.width - 100, self.frame.origin.y + self.frame.size.height - 30, 95, 30);
}


@end
