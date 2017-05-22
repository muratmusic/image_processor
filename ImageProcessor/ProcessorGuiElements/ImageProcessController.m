//
//  ImageProcessController.m
//  ImageProcessor
//
//  Created by Murat on 03.09.15.
//  Copyright (c) 2015 Murat. All rights reserved.
//

#import "ImageProcessController.h"
#import "ImageRotateProcess.h"
#import "ImageColorProcess.h"
#import "ImageMirrorProcess.h"
#import "UIButton+UserInfo.h"
#import "CommonMacros.h"

@interface ImageProcessController ()

@end

@implementation ImageProcessController

- (void)onImageProcessButton:(id)sender
{
    Class class = nil;
    UIButton *button = (UIButton *)sender;
    if (![button isMemberOfClass:[UIButton class]])
        assert(!"Sender must be UIButton object!");
    
    NSString *typeOfButton = button.userInfo[PROCESS_IMAGE_BUTTON_TYPE_KEY];
    if ([typeOfButton isEqualToString:PROCESS_IMAGE_BUTTON_ROTATE])
        class = [ImageRotateProcess class];
    else if ([typeOfButton isEqualToString:PROCESS_IMAGE_BUTTON_COLOR])
        class = [ImageColorProcess class];
    else if ([typeOfButton isEqualToString:PROCESS_IMAGE_BUTTON_MIRROR])
        class = [ImageMirrorProcess class];
    
    [class processImage:self.inputImageView.image success:^(UIImage *resultImage) {
        [self.listener onProcessImage:resultImage];
    } failure:^(NSError *error) {
        NSLog(@"error = %@", error);
        NSLog(@""); // breakpoint
    }];
}

@end
