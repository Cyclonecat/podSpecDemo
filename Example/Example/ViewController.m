//
//  ViewController.m
//  Example
//
//  Created by Mac on 16/12/28.
//  Copyright © 2016年 zichen0422. All rights reserved.
//

#import "ViewController.h"
#import <zichenPodSpec/zichenPodXibVC.h>
#import <zichenPodSpec/zichenHelp.h>
#import <zichenPodSpec/zichenPodStoryboardVC.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"主目录";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnclicked:(id)sender {
    
    // 跳转进入 
    UIStoryboard *sboard = [zichenHelp GetUIStoryBoardNamexibbundle];
    zichenPodStoryboardVC *ticketMainVC = [sboard instantiateViewControllerWithIdentifier:@"zichenPodStoryboardVC"];
    [self.navigationController pushViewController:ticketMainVC animated:YES];
}

@end
