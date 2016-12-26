//
//  BasedProfileViewController.m
//  Speedboy
//
//  Created by Minh Ta Hoang on 7/25/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import "BasedProfileTableViewController.h"

@implementation BasedProfileTableViewController


- (void) requestDownloadAvatar:(NSString *)strAvatar;
{
    self.strAvatarUrl = strAvatar;
    if (self.imgAvatar == nil) {
        if (self.strAvatarUrl) {
        }
    } else {
        [self handleAvatarImage:self.imgAvatar];
    }
}

#pragma mark capture image
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imgAvatar = chosenImage;
    self.isChangedAvatar = YES;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)showActionSheetToCaptureImage:(id)sender;
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:LocalizedString(@"_CANCEL_") destructiveButtonTitle:nil otherButtonTitles:LocalizedString(@"_CAMERA_"), LocalizedString(@"_PHOTO_GALLERY_"), nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog(@"button 0 clicked");
        self.imagePicker = [[UIImagePickerController alloc] init];
        self.imagePicker.delegate = self;
        self.imagePicker.allowsEditing = YES;
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            if ( [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront] ) {
                self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                self.imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
                [self presentViewController:self.imagePicker animated:YES completion:nil];
            } else {
                self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                self.imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
                [self presentViewController:self.imagePicker animated:YES completion:nil];
            }
        }
    } else if (buttonIndex == 1) {
        NSLog(@"button 1 clicked");
        self.imagePicker = [[UIImagePickerController alloc] init];
        self.imagePicker.delegate = self;
        self.imagePicker.allowsEditing = YES;
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    } else if (buttonIndex == 2) {
        
    }
}

- (void) handleAvatarImage:(UIImage *)avatar;
{
    
}

@end
