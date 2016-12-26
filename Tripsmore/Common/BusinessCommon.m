//
//  UDBusinessCommon.m
//  Speedboy
//
//  Created by Minh Ta Hoang on 7/24/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import "BusinessCommon.h"
#import "Utils.h"

@implementation BusinessCommon

+ (NSMutableAttributedString *) homeText1:(NSString *)text1
                      text2:(NSString *)text2
                      text3:(NSString *)text3;
{
    NSDictionary *attrs1 = @{ NSForegroundColorAttributeName : kColorMainColor,
                              NSFontAttributeName : [UIFont boldSystemFontOfSize:15]};
    NSMutableAttributedString * str1 = [[NSMutableAttributedString alloc] initWithString:text1 attributes:attrs1];
    if (text2 != nil) {
        NSDictionary *attrs2 = @{ NSForegroundColorAttributeName : kColorBlack,
                              NSFontAttributeName : [UIFont systemFontOfSize:13]};
        NSMutableAttributedString * str2 = [[NSMutableAttributedString alloc] initWithString:text2 attributes:attrs2];
        [str1 appendAttributedString:str2];
    }
    
    if (text3 != nil) {
        NSDictionary *attrs3 = @{ NSForegroundColorAttributeName : kColorMainColor,
                                  NSFontAttributeName : [UIFont boldSystemFontOfSize:13]};
        NSMutableAttributedString * str3 = [[NSMutableAttributedString alloc] initWithString:text3 attributes:attrs3];
        
        [str1 appendAttributedString:str3];
    }
    return str1;
}


@end
