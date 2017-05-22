//
//  UIColor+Extensions.m
//  ImageProcessor
//
//  Created by Murat on 27.09.15.
//  Copyright © 2015 Murat. All rights reserved.
//

#import "UIColor+Extensions.h"

@implementation UIColor (Extensions)

+ (UIColor *)colorWithHexRGB:(int)rgbValue
{
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.f \
        green:((float)((rgbValue & 0x00FF00) >>  8))/255.f \
        blue:((float)((rgbValue & 0x0000FF) >>  0))/255.f \
        alpha:1.0];
}

@end
