//
//  InputImageController.m
//  ImageProcessor
//
//  Created by Murat on 03.09.15.
//  Copyright (c) 2015 Murat. All rights reserved.
//
//------------------------------------------------------------------------------
#import "InputImageController.h"
#import "CommonMacros.h"
//------------------------------------------------------------------------------
@interface InputImageController ()
@property (nonatomic, strong) UIPopoverController *popoverController;
@end
//------------------------------------------------------------------------------
@implementation InputImageController
//------------------------------------------------------------------------------
- (void)autoSizeImgView
{
    UIImage *image = self.inputImgView.image;
    
    CGFloat hw_koeff = image.size.height / image.size.width;
    if (hw_koeff < 1.f)
    {
        self.inputImgWidthConstraint.constant = INPUT_IMG_MAX_WIDTH_HEIGHT;
        self.inputImgHeightConstraint.constant =
            roundf(INPUT_IMG_MAX_WIDTH_HEIGHT * hw_koeff);
    }
    else
    {
        self.inputImgWidthConstraint.constant =
            roundf(INPUT_IMG_MAX_WIDTH_HEIGHT / hw_koeff);
        self.inputImgHeightConstraint.constant = INPUT_IMG_MAX_WIDTH_HEIGHT;
    }
    
    [self.inputImgView.superview layoutIfNeeded];
}
//------------------------------------------------------------------------------
- (void)onSelectImageButton
{
    UIAlertController *actionController = [UIAlertController alertControllerWithTitle:nil
        message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* selectPhoto = [UIAlertAction
        actionWithTitle:NSLocalizedString(@"Выбрать фото", @"")
        style:UIAlertActionStyleDefault
        handler:^(UIAlertAction * action)
        {
            [self selectImageFromLibrary];
        }];
    
    [actionController addAction:selectPhoto];
    
    if ([UIImagePickerController isSourceTypeAvailable:
		UIImagePickerControllerSourceTypeCamera])
	{
        UIAlertAction* useCamera = [UIAlertAction
            actionWithTitle:NSLocalizedString(@"Сделать снимок", @"")
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction * action)
            {
                [self useCamera];
            }];
        
        [actionController addAction:useCamera];
    }
    
    UIAlertAction* cancel = [UIAlertAction
        actionWithTitle:@"Cancel"
        style:UIAlertActionStyleDefault
        handler:^(UIAlertAction * action)
        {
            // Do nothing
        }];
    
    [actionController addAction:cancel];
    
    [self.ownerController presentViewController:actionController animated:YES completion:nil];
}
//------------------------------------------------------------------------------
- (void)useCamera
{
    if ([UIImagePickerController isSourceTypeAvailable:
		UIImagePickerControllerSourceTypeCamera] == NO)
	{
        //TODO: show alert
        //NSLocalizedString(@"No camera on this device", @"")];
		return;
	}
    
    UIImagePickerController *picker =
		[[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self showImagePicker:picker];
}
//------------------------------------------------------------------------------
- (void)selectImageFromLibrary
{
	UIImagePickerController *picker =
		[[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary; //UIImagePickerControllerSourceTypeCamera;
		
	[self showImagePicker:picker];
}
//------------------------------------------------------------------------------
- (void)showImagePicker:(UIImagePickerController *)picker
{
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		self.popoverController = [[UIPopoverController alloc]
			initWithContentViewController:picker];
		self.popoverController.delegate = self;
		[self.popoverController presentPopoverFromRect:
			CGRectMake([[[UIApplication sharedApplication] delegate] window].frame.size.width/2.0-100,
			125, 200, 200) inView:self.ownerController.view
			permittedArrowDirections:UIPopoverArrowDirectionAny
			animated:YES];
	}
	else // iPhone, iPod touch
	{
		[self.ownerController presentViewController:picker animated:YES completion:^{
            
        }];
	}
}
//------------------------------------------------------------------------------
#pragma mark -
#pragma mark UIImagePickerControllerDelegate methods
//------------------------------------------------------------------------------
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
		[self.popoverController dismissPopoverAnimated:YES];
	else
		[picker dismissViewControllerAnimated:YES completion:^{
            
        }];
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    self.inputImgView.image = image;
    [self autoSizeImgView];
    
    UIView *superView = self.inputImgView.superview;
    for (UIView *subView in superView.subviews)
    {
        if ([subView isMemberOfClass:[UIButton class]])
        {
            UIButton *button = (UIButton *)subView;
            [button setTitle:@"" forState:UIControlStateNormal];
            break;
        }
    }
}
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
- (void)choosePhoto
{
/*
  const UIImagePickerControllerSourceType sourceType =
    //UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    UIImagePickerControllerSourceTypePhotoLibrary;

	if ([UIImagePickerController isSourceTypeAvailable:sourceType] == NO)
	{
    [CommonAlert showAlertWithTitle:
      NSLocalizedString(@"Фотоальбомы не найдены", @"")];
		return;
	}

	UIImagePickerController *picker =
		[[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.sourceType = sourceType;

	if (DEVINFO->DeviceType() == DEVICE_IPAD)
	{
		UIPopoverController *popOverContr =
			[[UIPopoverController alloc]
			initWithContentViewController:picker];
		self.popoverController = popOverContr;
		popoverController.delegate = self;		
		[popoverController presentPopoverFromRect:
			CGRectMake(DEVINFO->WorkAreaWidth()/2.0-100,
			125, 200, 200) inView:self.view
			permittedArrowDirections:UIPopoverArrowDirectionAny
			animated:YES];
	}
	else // iPhone, iPod touch
	{
		[self presentModalViewController:picker animated:YES];
	}
*/
}

@end
