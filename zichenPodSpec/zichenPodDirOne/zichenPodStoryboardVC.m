//
//  zichenPodStoryboardVC.m
//  zichenPodSpec
//
//  Created by Mac on 16/12/28.
//  Copyright © 2016年 zichen0422. All rights reserved.
//

#import "zichenPodStoryboardVC.h"
#import "zichenHeader.h"
#import "zichenHelp.h"
#import "zichenPodXibVC.h"

@interface zichenPodStoryboardVC ()

@end

@implementation zichenPodStoryboardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"测试的sb的VC";
    AFHTTPSessionManager *manager;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
- (IBAction)btnclicked:(id)sender {
    
    //UINib *bundle = [zichenHelp GetBundleNamexibbundle:@"zichenPodXibVC"];
    NSBundle *bundle = [zichenHelp GetBundleNamexibbundle];
    zichenPodXibVC *xibVC = [[zichenPodXibVC alloc] initWithNibName:@"zichenPodXibVC" bundle:bundle];
    [self.navigationController pushViewController:xibVC animated:YES];
}

@end
