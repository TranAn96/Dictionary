//
//  ImportViewController.m
//  Tripsmore
//
//  Created by Trần An on 12/9/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "ImportViewController.h"

@interface ImportViewController ()
@property NSMutableArray *arrWord;


@end

@implementation ImportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrWord = [[NSMutableArray alloc]init];
    [self.view addGestureRecognizer:[SWRevealViewController shareInstance].panGestureRecognizer];
    [self readFile:@"test.csv"];
    [self.btnMenu addTarget:self action:@selector(touchBack) forControlEvents:UIControlEventTouchUpInside];
}

-(void)readFile:(NSString * )str{
    NSString *file = [[NSString alloc] initWithContentsOfFile:str];
    NSArray *allLines = [file componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    for (NSString* line in allLines) {
        NSArray *elements = [line componentsSeparatedByString:@","];
        Words *word = [[Words alloc]init];
        word.edited = [elements objectAtIndex:0];
        word.favorites = [elements objectAtIndex:1];
        word.mId = [[elements objectAtIndex:2] intValue];
        word.word = [elements objectAtIndex:3];
        word.result = [elements objectAtIndex:4];
        word.strDescription = [elements objectAtIndex:5];
        [_arrWord addObject:word];
    }
}
-(void)touchBack{
    [[SWRevealViewController shareInstance] revealToggle:self.btnBack];
}
- (IBAction)import:(id)sender {
    Words *word = [[Words alloc]init];
    word.edited = @"-";
    word.favorites = @"1";
    word.mId = 10;
    word.word = @"delete";
    word.result = @"Xoá";
    [[DatabaseService shareInstance]insertIntoEng:word changeEditTime:YES];
}
@end
