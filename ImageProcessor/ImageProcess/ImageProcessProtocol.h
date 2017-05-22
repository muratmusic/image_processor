//
//  ImageProcessProtocol.h
//  ImageProcessor
//
//  Created by Murat on 03.09.15.
//  Copyright (c) 2015 Murat. All rights reserved.
//
//  This is protocol of image processing: rotating, color/mirror/etc. processing

#import <UIKit/UIKit.h>

@protocol ImageProcessProtocol
+ (void)processImage:(UIImage *)inputImage
success:(void (^)(UIImage *resultImage))success
failure:(void (^)(NSError *error))failure;

@end
