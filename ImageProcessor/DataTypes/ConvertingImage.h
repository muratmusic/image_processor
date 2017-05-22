//
//  ConvertingImage.h
//  ImageProcessor
//
//  Created by Murat on 20.09.15.
//  Copyright (c) 2015 Murat. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ConvertingImageStateUndefined,
    ConvertingImageStateInProgress,
    ConvertingImageStateCompleted
} ConvertingImageState;

@interface ConvertingImage : UIImage
@property (assign) ConvertingImageState convertingState;
@end
