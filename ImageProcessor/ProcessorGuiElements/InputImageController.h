//
//  InputImageController.h
//  ImageProcessor
//
//  Created by Murat on 03.09.15.
//  Copyright (c) 2015 Murat. All rights reserved.
//
//  We show input image, use the camera and select input image

#import <UIKit/UIKit.h>

@interface InputImageController : NSObject
<UINavigationControllerDelegate, UIImagePickerControllerDelegate,
UIPopoverControllerDelegate>

@property (nonatomic, weak) UIImageView *inputImgView;
@property (nonatomic, weak) NSLayoutConstraint *inputImgWidthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *inputImgHeightConstraint;
@property (nonatomic, weak) UIViewController *ownerController;

- (void)onSelectImageButton;

@end
