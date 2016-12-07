//
//  ViewController.m
//  NewFeaturesDemo
//
//  Created by 彦明 on 16/12/5.
//  Copyright © 2016年 Yanming. All rights reserved.
//
// 1000/2.5 = x/250
#import "ViewController.h"
#import "YMNewFeaturesViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)toNewFeaturesVC:(UIButton *)sender {
    YMNewFeaturesViewController *newFeaturesVC = [[YMNewFeaturesViewController alloc] init];
    newFeaturesVC.imagesArray = @[@"750a", @"750b", @"750c", @"750d"];
    [self presentViewController:newFeaturesVC animated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
