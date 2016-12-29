//
//  zichenPodXibVC.m
//  zichenPodSpec
//
//  Created by Mac on 16/12/28.
//  Copyright © 2016年 zichen0422. All rights reserved.
//

#import "zichenPodXibVC.h"
#import "zichenHeader.h"

@interface zichenPodXibVC ()

@property (nonatomic, strong) BMKMapView *mapView;

@end

@implementation zichenPodXibVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"测试的xib的VC";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
