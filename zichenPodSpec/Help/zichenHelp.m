//
//  zichenHelp.m
//  zichenPodSpec
//
//  Created by Mac on 16/12/28.
//  Copyright © 2016年 zichen0422. All rights reserved.
//

#import "zichenHelp.h"

@implementation zichenHelp

+ (NSBundle *)bundleForPod:(NSString*)podName
{
    NSString* bundlePath = [self bundlePathForPod:podName];
    if (bundlePath) {
        return [NSBundle bundleWithPath:bundlePath];
    }
    
    return nil;
}

+ (NSBundle *)GetBundleNamexibbundle
{
    NSString* bundlePath = [self bundlePathForPod:@"xibbundle"];
    if (bundlePath) {
        return [NSBundle bundleWithPath:bundlePath];
    }
    
    return nil;
}

+ (UIStoryboard *)GetUIStoryBoardNamexibbundle
{
    NSString* bundlePath = [self bundlePathForPod:@"xibbundle"];
    if (bundlePath) {
        NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
        if (bundle) {
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"zichen" bundle:bundle];
            if (storyBoard) {
                return storyBoard;
            }
        }
    }
    
    return nil;
}

+ (UINib *)GetBundleNamexibbundle:(NSString *)xibName
{
    NSString* bundlePath = [self bundlePathForPod:@"xibbundle"];
    if (bundlePath) {
        NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
        if (!bundle) {
            return nil;
        }
        UINib *nib = [UINib nibWithNibName:xibName bundle:bundle];
        if (nib) {
            return nib;
        }
    }
    
    return nil;
}

+ (NSBundle *)GetBundleNameImage
{
    NSString* bundlePath = [self bundlePathForPod:@"imageBundle"];
    if (bundlePath) {
        return [NSBundle bundleWithPath:bundlePath];
    }
    
    return nil;
}

+ (UIImage *)GetUIImageInBundleNameImage:(NSString *)imageName
{
    NSString* bundlePath = [self bundlePathForPod:@"imageBundle"];
    if (bundlePath) {
        NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
        NSString *imagePath = [bundle pathForResource:imageName ofType:@"png" inDirectory:nil];
        //图片路径是nil
        if (!imagePath.length) {
            if (imageName.length) {
                return [UIImage imageNamed:imageName];
            }
            return nil;
        }
        
        UIImage *image = [UIImage imageNamed:imagePath];
        if (image) {
            return image;
        }
    }
    
    return nil;
}

#pragma mark - /*** private ***/
+ (NSArray *)recursivePathsForResourcesOfType:(NSString *)type name:(NSString*)name inDirectory:(NSString *)directoryPath
{
    
    NSMutableArray *filePaths = [[NSMutableArray alloc] init];
    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:directoryPath];
    
    NSString *filePath;
    
    while ((filePath = [enumerator nextObject]) != nil){
        if (!type || [[filePath pathExtension] isEqualToString:type]){
            if (!name || [[[filePath lastPathComponent] stringByDeletingPathExtension] isEqualToString:name]){
                [filePaths addObject:[directoryPath stringByAppendingPathComponent:filePath]];
            }
        }
    }
    
    return filePaths;
}

+ (NSBundle*)bundleContainsPod:(NSString*)podName
{
    // search all bundles
    for (NSBundle* bundle in [NSBundle allBundles]) {
        NSString* bundlePath = [bundle pathForResource:podName ofType:@"bundle"];
        if (bundlePath) { return bundle; }
    }
    
    // search all frameworks
    for (NSBundle* bundle in [NSBundle allBundles]) {
        NSArray* bundles = [self recursivePathsForResourcesOfType:@"bundle" name:podName inDirectory:[bundle bundlePath]];
        if (bundles.count > 0) {
            return bundle;
        }
    }
    
    // some pods do not use "resource_bundles"
    // please check the pod's podspec
    return nil;
}

+ (NSString*)bundlePathForPod:(NSString*)podName
{
    // search all bundles
    for (NSBundle* bundle in [NSBundle allBundles]) {
        NSString* bundlePath = [bundle pathForResource:podName ofType:@"bundle"];
        if (bundlePath) { return bundlePath; }
    }
    
    // search all frameworks
    for (NSBundle* bundle in [NSBundle allBundles]) {
        NSArray* bundles = [self recursivePathsForResourcesOfType:@"bundle" name:podName inDirectory:[bundle bundlePath]];
        if (bundles.count > 0) {
            return bundles.firstObject;
        }
    }
    // some pods do not use "resource_bundles"
    // please check the pod's podspec
    return nil;
}

@end
