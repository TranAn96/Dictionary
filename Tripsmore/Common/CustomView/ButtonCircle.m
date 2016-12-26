//
//  ButtonRoundCorner.m
//  Speedboy
//
//  Created by Minh Ta Hoang on 6/29/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import "ButtonCircle.h"

@implementation ButtonCircle

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.layer.cornerRadius = self.frame.size.height/2;
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.layer.borderColor = kColorMainColor.CGColor;
        self.layer.borderWidth = 1.0f;
        self.clipsToBounds = YES;
    }
    return self;
}

@end
