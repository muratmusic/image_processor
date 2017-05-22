//
//  ImageRotateProcess.m
//  ImageProcessor
//
//  Created by Murat on 03.09.15.
//  Copyright (c) 2015 Murat. All rights reserved.
//

#import "ImageRotateProcess.h"

@implementation ImageRotateProcess

#pragma mark - Rotate UIImage
+ (void)processImage:(UIImage *)inputImage
success:(void (^)(UIImage *resultImage))success
failure:(void (^)(NSError *error))failure {
    CGSize size = inputImage.size;
    UIGraphicsBeginImageContext(CGSizeMake(size.height, size.width));
    [[UIImage imageWithCGImage:[inputImage CGImage] scale:1.0 orientation:UIImageOrientationLeft] drawInRect:CGRectMake(0,0,size.height ,size.width)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    success(newImage);
}

@end
