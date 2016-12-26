//
//  ButtonRoundCorner.m
//  Speedboy
//
//  Created by Minh Ta Hoang on 7/26/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import "ButtonRoundCorner.h"

@implementation ButtonRoundCorner

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
    [self refreshCorner];
}

- (void) refreshCorner
{
    self.layer.cornerRadius = 5;
    self.clipsToBounds = YES;
    self.layer.borderWidth = self.border_width;
    self.layer.borderColor = kColorLightGray.CGColor;
}



- (void)setValue:(id)value forKeyPath:(NSString *)keyPath
{
    if ([keyPath isEqualToString:k_border_width]) {
        self.border_width = [value floatValue];
    }
}
@end
