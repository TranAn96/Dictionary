//
//  TraslateMoreViewController.m
//  Tripsmore
//
//  Created by Trần An on 12/16/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "TraslateMoreViewController.h"

@interface TraslateMoreViewController ()

@end

@implementation TraslateMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addGestureRecognizer:[SWRevealViewController shareInstance].panGestureRecognizer];
    NSString *fullURL = @"https://translate.google.com/?hl=vi";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_viewWeb loadRequest:requestObj];
}

@end
