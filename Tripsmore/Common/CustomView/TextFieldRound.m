//
//  TextFieldRound.m
//  Speedboy
//
//  Created by TaHoangMinh on 10/13/15.
//  Copyright © 2015 TaHoangMinh. All rights reserved.
//

#import "TextFieldRound.h"

@implementation TextFieldRound

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {

    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.viewBackground == nil) {
        self.viewBackground = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x - 10, self.frame.origin.y - 10, self.frame.size.width + 20, self.frame.size.height + 20)];
        self.viewBackground.layer.cornerRadius = 5.0f;
        self.viewBackground.backgroundColor = kColorGray;
        self.alpha = 0.8;
        self.viewBackground.alpha = 0.8;
        [self.superview insertSubview:self.viewBackground atIndex:0];
    }
}

@end
