//
//  ImageColorProcess.m
//  ImageProcessor
//
//  Created by Murat on 03.09.15.
//  Copyright (c) 2015 Murat. All rights reserved.
//

#import "ImageColorProcess.h"

@implementation ImageColorProcess

#pragma mark - Make UIImage gray
+ (void)processImage:(UIImage *)inputImage
success:(void (^)(UIImage *resultImage))success
failure:(void (^)(NSError *error))failure {
    // Create image rectangle with current image width/height
    CGRect imageRect = CGRectMake(0, 0, inputImage.size.width, inputImage.size.height);

    // Grayscale color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();

    // Create bitmap content with current image size and grayscale colorspace
    CGContextRef context = CGBitmapContextCreate(nil, inputImage.size.width, inputImage.size.height,
        8, 0, colorSpace, 0);

    // Draw image into current context, with specified rectangle
    // using previously defined context (with grayscale colorspace)
    CGContextDrawImage(context, imageRect, [inputImage CGImage]);

    // Create bitmap image info from pixel data in current context
    CGImageRef imageRef = CGBitmapContextCreateImage(context);

    // Create a new UIImage object  
    UIImage *newImage = [UIImage imageWithCGImage:imageRef];

    // Release colorspace, context and bitmap information
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    CFRelease(imageRef);
    
    success(newImage);
}

@end
