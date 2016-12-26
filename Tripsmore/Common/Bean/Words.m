//
//  AnswerBean.m
//  Speedboy
//
//  Created by Minh Ta Hoang on 8/3/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import "Words.h"

@implementation Words

- (void)encodeWithCoder:(NSCoder *)aCoder;{
    [aCoder encodeObject:self.word forKey:@"word"];
    [aCoder encodeObject:self.result forKey:@"result"];
    [aCoder encodeObject:self.strDescription forKey:@"strDescription"];
    [aCoder encodeObject:self.translitetation forKey:@"translitetation"];

}
- (id)initWithCoder:(NSCoder *)aDecoder;
{
    if((self = [super init])) {
        //decode properties, other class vars
        self.word = [aDecoder decodeObjectForKey:@"word"];
        self.result = [aDecoder decodeObjectForKey:@"result"];
        self.strDescription = [aDecoder decodeObjectForKey:@"strDescription"];
        self.translitetation = [aDecoder decodeObjectForKey:@"translitetation"];

    }
    return self;
}
@end
