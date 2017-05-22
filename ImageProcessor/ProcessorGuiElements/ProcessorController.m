//
//  ProcessorController.m
//  ImageProcessor
//
//  Created by Murat on 03.09.15.
//  Copyright (c) 2015 Murat. All rights reserved.
//

#import "ProcessorController.h"
#import "InputImageController.h"
#import "ImageProcessController.h"
#import "ResultImagesController.h"
#import "UIButton+UserInfo.h"
#import "CommonMacros.h"



@interface ProcessorController ()

@property (nonatomic, strong) InputImageController *inputImgController;
@property (nonatomic, strong) IBOutlet UIImageView *inputImgView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *inputImgWidthConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *inputImgHeightConstraint;

@property (nonatomic, strong) ImageProcessController *imgProcessController;
@property (nonatomic, strong) ResultImagesController *resultImgController;

@property (nonatomic, strong) IBOutlet UIButton *rotateProcessButton;
@property (nonatomic, strong) IBOutlet UIButton *colorProcessButton;
@property (nonatomic, strong) IBOutlet UIButton *mirrorProcessButton;

@property (nonatomic, strong) IBOutlet UITableView *resultsTable;

@end



@implementation ProcessorController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.inputImgController = [[InputImageController alloc] init];
    self.inputImgController.ownerController = self;
    self.inputImgController.inputImgView = self.inputImgView;
    self.inputImgWidthConstraint.constant = INPUT_IMG_MAX_WIDTH_HEIGHT;
    self.inputImgHeightConstraint.constant = INPUT_IMG_MAX_WIDTH_HEIGHT;
    self.inputImgController.inputImgWidthConstraint = self.inputImgWidthConstraint;
    self.inputImgController.inputImgHeightConstraint = self.inputImgHeightConstraint;
    
    self.imgProcessController = [[ImageProcessController alloc] init];
    self.imgProcessController.inputImageView = self.inputImgView;    
    self.resultImgController = [[ResultImagesController alloc] init];
    self.imgProcessController.listener = self.resultImgController;
    
    SEL buttonSelector = @selector(onImageProcessButton:);
    self.rotateProcessButton.userInfo =
        @{ PROCESS_IMAGE_BUTTON_TYPE_KEY: PROCESS_IMAGE_BUTTON_ROTATE };
    [self.rotateProcessButton addTarget:self.imgProcessController action:buttonSelector
        forControlEvents:UIControlEventTouchUpInside];
    self.colorProcessButton.userInfo =
        @{ PROCESS_IMAGE_BUTTON_TYPE_KEY: PROCESS_IMAGE_BUTTON_COLOR };
    [self.colorProcessButton addTarget:self.imgProcessController action:buttonSelector
        forControlEvents:UIControlEventTouchUpInside];
    self.mirrorProcessButton.userInfo =
        @{PROCESS_IMAGE_BUTTON_TYPE_KEY: PROCESS_IMAGE_BUTTON_MIRROR };
    [self.mirrorProcessButton addTarget:self.imgProcessController action:buttonSelector
        forControlEvents:UIControlEventTouchUpInside];
    
    self.resultsTable.dataSource = self.resultImgController;
    self.resultsTable.delegate = self.resultImgController;
    self.resultImgController.resultsTable = self.resultsTable;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSelectImageButton
{
    [self.inputImgController onSelectImageButton];
}

@end
