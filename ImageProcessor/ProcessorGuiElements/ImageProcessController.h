//
//  ImageProcessController.h
//  ImageProcessor
//
//  Created by Murat on 03.09.15.
//  Copyright (c) 2015 Murat. All rights reserved.
//
//  We work with image processing only

#import <UIKit/UIKit.h>

@protocol ImageProcessListener <NSObject>
- (void)onProcessImage:(UIImage *)processedImage;
@end

@interface ImageProcessController : NSObject

@property (nonatomic, weak) UIImageView *inputImageView;
@property (nonatomic, weak) id<ImageProcessListener> listener;

- (void)onImageProcessButton:(id)sender;

@end
