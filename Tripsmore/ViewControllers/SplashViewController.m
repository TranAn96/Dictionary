//
//  SplashViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/12/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "SplashViewController.h"
#import "StaticData.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

static id instance = nil;
+ (SplashViewController *)shareInstance;
{
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"initial" sender:nil];
    });
    self.view.backgroundColor = [StaticData sharedInstance].mainColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
