//
//  UIScrollView+FSExtension.m
//  Pods
//
//  Created by Wenchao Ding on 5/3/15.
//
//

#import "UIScrollView+FSExtension.h"

@implementation UIScrollView (FSExtension)

- (void)fs_scrollBy:(CGPoint)offset animate:(BOOL)animate
{
    if (!animate) {
        self.contentOffset = CGPointMake(self.contentOffset.x+offset.x, self.contentOffset.y+offset.y);
    } else {
        
    }
}

@end
// Copyright belongs to original author
// http://code4app.net (en) http://code4app.com (cn)
// From the most professional code share website: Code4App.net