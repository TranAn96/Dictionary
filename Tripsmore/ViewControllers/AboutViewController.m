//
//  AboutViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LocalizedString(@"About");
    [self.view addGestureRecognizer:[SWRevealViewController shareInstance].panGestureRecognizer];
    
    [self.webView loadHTMLString:@"<html><body><p align=\"justify\" style=\"font-size:18px;\">Sản phẩm được xây dựng bởi nhóm 1 - Bộ môn CNPM - Học phần : Project1. Nhóm gồm các thành viên :<br/><br/>1. Trần Tuấn An.<br/>2. Nguyễn Đình An.<br/>3.Lê Bảo Chi<br/><br/><br/>Sản phẩm hiện vẫn đang được cải tiến và sẽ có những bản cập nhập mới với nhiều tính năng hơn . <br/><br/>Mọi thắc mắc góp ý xin liên hệ trực tiếp với chúng tôi .<br/>Email us: trantuanan08121996@gmail.com<br/>Ph: +84-163-590-5880</p> </body></html>" baseURL:nil];
}

- (void)backAction:(id)sender
{
    [[SWRevealViewController shareInstance] revealToggle:self.btnBack];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
