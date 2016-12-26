//
//  BasedProfileViewController.h
//  Speedboy
//
//  Created by Minh Ta Hoang on 7/25/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import "BasedTextInputScrollViewController.h"
#import "BasedTableViewController.h"

@interface BasedProfileTableViewController : BasedTableViewController <UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate>

@property UIImagePickerController *imagePicker;
@property UIImage *imgAvatar;
@property BOOL isChangedAvatar;
@property NSString *strAvatarUrl;

- (void)showActionSheetToCaptureImage:(id)sender;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
- (void) handleAvatarImage:(UIImage *)avatar;
- (void) requestDownloadAvatar:(NSString *)strAvatar;

@end
