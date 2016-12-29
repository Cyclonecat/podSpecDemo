//
//  zichenHelp.h
//  zichenPodSpec
//
//  Created by Mac on 16/12/28.
//  Copyright © 2016年 zichen0422. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface zichenHelp : NSObject


+ (NSBundle *)bundleForPod:(NSString*)podName;

+ (NSBundle *)GetBundleNamexibbundle;

+ (UIStoryboard *)GetUIStoryBoardNamexibbundle;

+ (UINib *)GetBundleNamexibbundle:(NSString *)xibName;

+ (NSBundle *)GetBundleNameImage;

+ (UIImage *)GetUIImageInBundleNameImage:(NSString *)imageName;

@end
