//
//  ConvertingImage.m
//  ImageProcessor
//
//  Created by Murat on 20.09.15.
//  Copyright (c) 2015 Murat. All rights reserved.
//

#import "ConvertingImage.h"

@implementation ConvertingImage

- (id)init
{
    if (self = [super init])
    {
        self.convertingState = ConvertingImageStateUndefined;
    }
    
    return self;
}

@end
