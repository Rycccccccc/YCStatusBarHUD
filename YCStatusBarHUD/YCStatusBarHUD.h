//
//  YCStatusBarHUD.h
//  YCStatusBarHUD
//
//  Created by 任任义春 on 16/5/31.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCStatusBarHUD : NSObject


/**
 *  显示普通信息
 *
 *  @param msg   文字
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 *  显示普通信息
 */
+ (void)showMessage:(NSString *)msg;

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;
/**
 *  显示失败的信息
 */
+ (void)showError:(NSString *)msg;
/**
 *  显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg;

/**
 *  隐藏
 */
+ (void)hide;

@end
