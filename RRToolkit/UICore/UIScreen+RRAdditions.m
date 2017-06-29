//
//  UIScreen+Additions.m
//  NavDemo
//
//  Created by Ryan on 15/5/27.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "UIScreen+RRAdditions.h"
#import "RRPreprocessorMacros.h"

@implementation UIScreen (Additions)

CGFloat OnePixel() { return 1.0 / UIScreen.scale; }

+ (CGFloat)screenWidth{
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return [UIScreen mainScreen].nativeBounds.size.height / [UIScreen mainScreen].nativeScale;

    } else {
        return [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale;
    }
}

+ (CGFloat)screenHeight{
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        if ([UIApplication sharedApplication].statusBarFrame.size.width > 20) {
            return [UIScreen mainScreen].nativeBounds.size.width / [UIScreen mainScreen].nativeScale - 20;
        }
        return [UIScreen mainScreen].nativeBounds.size.width / [UIScreen mainScreen].nativeScale;

    } else {
        if ([UIApplication sharedApplication].statusBarFrame.size.height > 20) {
            return [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale - 20;
        }
        return [UIScreen mainScreen].nativeBounds.size.height / [UIScreen mainScreen].nativeScale;
    }
}

+ (CGFloat)scale{
    return [UIScreen mainScreen].nativeScale;
}

+ (CGFloat)screenScaleRatio {
    return [UIScreen screenWidth] / 375.f;
}


@end
