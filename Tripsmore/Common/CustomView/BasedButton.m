//
//  BasedButton.m
//  Speedboy
//
//  Created by Minh Ta Hoang on 7/28/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import "BasedButton.h"

@implementation BasedButton

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.currentAlpha = self.alpha;
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    if (highlighted) {
        self.alpha = 0.5;
    } else {
        self.alpha = self.currentAlpha;
    }
}

@end
