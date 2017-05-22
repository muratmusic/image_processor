//
//  ResultImagesController.m
//  ImageProcessor
//
//  Created by Murat on 20.09.15.
//  Copyright (c) 2015 Murat. All rights reserved.
//

#import "ResultImagesController.h"
#import "ConvertingImage.h"
#import "CommonMacros.h"
#import "UIColor+Extensions.h"

@interface ResultImagesController ()
@property (nonatomic, strong) NSMutableArray *results; // array of ConvertingImage
@end

@implementation ResultImagesController

- (id)init
{
    if (self = [super init])
    {
        self.results = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellProgressIdentifier = @"CellProgressIdentifier";
    static NSString *CellImageIdentifier = @"CellImageIdentifier";
    
    ConvertingImage *image = self.results[indexPath.row];
    
    NSString *cellIdentifier = CellImageIdentifier;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    const NSInteger IMAGE_TAG = 12345;
    UIImageView *imgView = nil;
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
            reuseIdentifier:cellIdentifier];
        UIView *imgSuperView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,
            RESULT_IMG_MAX_WIDTH_HEIGHT, RESULT_IMG_MAX_WIDTH_HEIGHT)];
        [cell addSubview:imgSuperView];
        imgSuperView.backgroundColor = [UIColor colorWithHexRGB:0xEBFFEB];
        [cell addSubview:imgSuperView];
        imgView = [[UIImageView alloc] init];
        imgView.tag = IMAGE_TAG;
        [imgSuperView addSubview:imgView];
    }
    else
    {
        imgView = (UIImageView *)[cell viewWithTag:IMAGE_TAG];
    }
    
    imgView.image = (UIImage *)image;
    [self autoSizeImgView:imgView];
    return cell;
}

- (void)autoSizeImgView:(UIImageView *)imgView
{
    UIImage *image = imgView.image;
    
    CGFloat hw_koeff = image.size.height / image.size.width;
    CGFloat width = 0.f, height = 0.f;
    if (hw_koeff < 1.f)
    {
        width = RESULT_IMG_MAX_WIDTH_HEIGHT;
        height = roundf(RESULT_IMG_MAX_WIDTH_HEIGHT * hw_koeff);
    }
    else
    {
        width = roundf(RESULT_IMG_MAX_WIDTH_HEIGHT / hw_koeff);
        height = RESULT_IMG_MAX_WIDTH_HEIGHT;
    }
    
    imgView.bounds = CGRectMake(0.f, 0.f, width, height);
    imgView.center = CGPointMake(imgView.superview.bounds.size.width/2.f,
        imgView.superview.bounds.size.height/2.f);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return RESULT_IMG_MAX_WIDTH_HEIGHT;
}

#pragma mark - ImageProcessListener method
- (void)onProcessImage:(UIImage *)processedImage
{
    ConvertingImage *image = [[ConvertingImage alloc] initWithCGImage:processedImage.CGImage];
    [self.results insertObject:image atIndex:0];
    [self.resultsTable reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
