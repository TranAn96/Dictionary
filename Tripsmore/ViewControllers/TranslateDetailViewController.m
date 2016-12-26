//
//  TranslateDetailViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "TranslateDetailViewController.h"
#import "AddWordViewController.h"
#import "DatabaseService.h"
#import <AVFoundation/AVFoundation.h>

@interface TranslateDetailViewController ()

@end

@implementation TranslateDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LocalizedString(@"Translation Detail");
    
    [self refreshWordData];
    
    if ([@"1" isEqualToString:self.word.favorites]) {
        self.btnFavourite.selected = YES;
    } else {
        self.btnFavourite.selected = NO;
    }
    
    NSLog(@"%@", self.word.favorites);
    [self saveCustomObject:self.word key:@"Word"];
    
}
- (void)saveCustomObject:(Words *)object key:(NSString *)key {
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:key];
    [defaults synchronize];
    
}

- (Words *)loadCustomObjectWithKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    Words *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshWordData];
}
- (void) refreshWordData
{
    self.lblWord.text = self.word.word;
    self.lblDescription.text = self.word.strDescription;
    self.lblResult.text = self.word.result;
    self.lblEdited.text = self.word.edited;
    self.lblTranslite.text = self.word.translitetation;
}

- (IBAction)btnFavouriteClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (!sender.selected) {
        self.word.favorites = @"-";
        [self.view makeToast:LocalizedString(@"Removed from favourite") duration:9.0 position:nil];
        [self refreshWordData];
    } else {
        self.word.favorites = @"1";
        [self.view makeToast:LocalizedString(@"Added to favourite") duration:9.0 position:nil];
        [self refreshWordData];

    }
    [[DatabaseService shareInstance] update:self.word changeEditTime:YES];

}
- (IBAction)btnShareclicked:(id)sender {
    NSString *str=[NSString stringWithFormat:@"%@\n%@\nTranslate using: http://app_itune_link_here", self.word.word, self.word.result];
    NSArray *postItems=@[str];
    
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:postItems applicationActivities:nil];
    controller.excludedActivityTypes = @[];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        // For iPhone
        [self presentViewController:controller animated:YES completion:nil];
    }
    else {
        // For iPad, present it as a popover as you already know
        UIPopoverController *popup = [[UIPopoverController alloc] initWithContentViewController:controller];
        //Change rect according to where you need to display it. Using a junk value here
        [popup presentPopoverFromRect:CGRectMake(self.view.frame.size.width, 30, 0, 0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

- (IBAction)btnEditClicked:(id)sender {
    UIActionSheet *actionsheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:LocalizedString(@"Cancel") destructiveButtonTitle:nil otherButtonTitles:LocalizedString(@"Edit"), LocalizedString(@"Delete"), nil];
    actionsheet.tag = 1001;
    [actionsheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 2) {
        // do nothing
    } else if (buttonIndex == 0) {
        NSLog(@"Edit");
        AddWordViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"AddWordEditViewController"];
        vc.word = self.word;
        [self.navigationController pushViewController:vc animated:YES];
    } else if (buttonIndex == 1) {
        UIAlertView *alertDelete = [[UIAlertView alloc]initWithTitle:@"Do you want to delete this word?" message:nil delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
        [alertDelete show];
        NSLog(@"Delete");
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{if (buttonIndex == 1) {
        DatabaseService *anhAn = [[DatabaseService alloc]init];
        [anhAn deleteW:self.word];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)btntxtSp:(id)sender {
    if (_word.isEng2Pa) {
        AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.lblWord.text];
        utterance.rate = AVSpeechUtteranceMinimumSpeechRate;
        utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
        [synthesizer speakUtterance:utterance];
    }else{
        AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.lblWord.text];
        utterance.rate = AVSpeechUtteranceMinimumSpeechRate;
        utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"fr-FR"];
        [synthesizer speakUtterance:utterance];
    }
}
- (IBAction)btnRender:(id)sender {
    NSMutableData *pdfData = [NSMutableData data];
    UIGraphicsBeginPDFContextToData(pdfData,self.view.bounds, nil);
    UIGraphicsBeginPDFPage();
    
    CGContextRef pdfContext = UIGraphicsGetCurrentContext();
    
    // draws rect to the view and thus this is captured by UIGraphicsBeginPDFContextToData
    [self.view.layer renderInContext:pdfContext];
    
    // remove PDF rendering context
    UIGraphicsEndPDFContext();
    
    // Retrieves the document directories from the iOS device
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString* documentDirectoryFilename = [documentDirectory stringByAppendingPathComponent:@"ess.pdf"];
    
    // instructs the mutable data object to write its context to a file on disk
    [pdfData writeToFile:documentDirectoryFilename atomically:YES];
}
-(void)createPDFfromUIView:(UIView*)aView saveToDocumentsWithFileName:(NSString*)aFilename
{
    // Creates a mutable data object for updating with binary data, like a byte array
    NSMutableData *pdfData = [NSMutableData data];
    
    // Points the pdf converter to the mutable data object and to the UIView to be converted
    UIGraphicsBeginPDFContextToData(pdfData, aView.bounds, nil);
    UIGraphicsBeginPDFPage();
    CGContextRef pdfContext = UIGraphicsGetCurrentContext();
    
    
    // draws rect to the view and thus this is captured by UIGraphicsBeginPDFContextToData
    
    [aView.layer renderInContext:pdfContext];
    
    // remove PDF rendering context
    UIGraphicsEndPDFContext();
    
    // Retrieves the document directories from the iOS device
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString* documentDirectoryFilename = [documentDirectory stringByAppendingPathComponent:aFilename];
    
    // instructs the mutable data object to write its context to a file on disk
    [pdfData writeToFile:documentDirectoryFilename atomically:YES];
    NSLog(@"documentDirectoryFileName: %@",documentDirectoryFilename);
}
@end
