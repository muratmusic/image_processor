//
//  ResultImagesController.h
//  ImageProcessor
//
//  Created by Murat on 20.09.15.
//  Copyright (c) 2015 Murat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageProcessController.h"

@class ConvertingImage;

@interface ResultImagesController : NSObject
<UITableViewDataSource, UITableViewDelegate,
ImageProcessListener, UIImagePickerControllerDelegate>

@property (nonatomic, weak) UITableView *resultsTable;

@end
