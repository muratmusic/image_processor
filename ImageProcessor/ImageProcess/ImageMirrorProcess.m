//
//  ImageMirrorProcess.m
//  ImageProcessor
//
//  Created by Murat on 03.09.15.
//  Copyright (c) 2015 Murat. All rights reserved.
//

#import "ImageMirrorProcess.h"

@implementation ImageMirrorProcess

#pragma mark - Make UIImage as mirrored
+ (void)processImage:(UIImage *)inputImage
success:(void (^)(UIImage *resultImage))success
failure:(void (^)(NSError *error))failure {
    UIImageOrientation flippedOrientation = UIImageOrientationUpMirrored;
    switch (inputImage.imageOrientation) {
        case UIImageOrientationUp:
            break;
        case UIImageOrientationDown:
            flippedOrientation = UIImageOrientationDownMirrored;
            break;
        default:
            break;
    }
    
    UIImage *flippedImage = [UIImage imageWithCGImage:inputImage.CGImage scale:1.0 orientation:flippedOrientation];

    CGImageRef inImage = inputImage.CGImage;
    CGContextRef ctx = CGBitmapContextCreate(NULL, CGImageGetWidth(inImage),
        CGImageGetHeight(inImage), CGImageGetBitsPerComponent(inImage),
        CGImageGetBytesPerRow(inImage), CGImageGetColorSpace(inImage),
        CGImageGetBitmapInfo(inImage));
    CGAffineTransform transform = CGAffineTransformMakeTranslation(flippedImage.size.width, 0.0);
    transform = CGAffineTransformScale(transform, -1.0, 1.0);
    CGContextConcatCTM(ctx, transform);
    
    CGContextDrawImage(ctx, CGRectMake(0, 0, CGImageGetWidth(inImage), CGImageGetHeight(inImage)), inImage);

    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    CGContextRelease(ctx);
    UIImage *resultImg = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    success(resultImg);
}

@end
