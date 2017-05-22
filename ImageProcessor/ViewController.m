//
//  ViewController.m
//  ImageProcessor
//
//  Created by Murat on 03.09.15.
//  Copyright (c) 2015 Murat. All rights reserved.
//

#import "ViewController.h"
#import "ProcessorController.h"

@interface ViewController ()
@property (nonatomic, strong) ProcessorController *imageProcessorController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageProcessorController =
        [[ProcessorController alloc] initWithNibName:nil bundle:nil];
    [self.view addSubview:self.imageProcessorController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
