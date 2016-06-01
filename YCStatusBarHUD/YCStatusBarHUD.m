//
//  YCStatusBarHUD.m
//  YCStatusBarHUD
//
//  Created by 任任义春 on 16/5/31.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCStatusBarHUD.h"

#define YCMessageFont [UIFont systemFontOfSize:12]
/** 消息的停留时间 */
static CGFloat const YCMessageDuration = 2.0;
/** 消息显示或隐藏动画的时间 */
static CGFloat const YCAnimationDuration = 0.25;
@implementation YCStatusBarHUD

/**
 *  全局的窗口
 */
static UIWindow *window_;

/** 定时器 */
static NSTimer *timer_;

/**
 *  显示窗口
 */
+ (void )showWindow {
    // 显示窗口
    
    // frame 数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 显示窗口
    window_.hidden = YES; // 先处理以前的残留问题
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.frame = frame;
    window_.hidden = NO;
    window_.windowLevel = UIWindowLevelStatusBar;
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:YCAnimationDuration animations:^{
       
        window_.frame = frame;
    }];
    
}


/**
 *  显示普通信息
 *
 *  @param msg   文字
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image {

    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    
    // 显示窗口
    [self showWindow];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    if (image) { // 如果有图片
        [button setImage:image forState:UIControlStateNormal];
         button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font  = YCMessageFont;
   
    [window_ addSubview:button];
    
    
    // 定时消失
    timer_ = [NSTimer scheduledTimerWithTimeInterval:YCMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
    
}

/**
 *  显示普通信息
 */
+ (void)showMessage:(NSString *)msg {
    
    [self showMessage:msg image:nil];
}

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg {
    [self showMessage:msg image:[UIImage imageNamed:@"YCStatusBarHUD.bundle/success"]];

}
/**
 *  显示失败的信息
 */
+ (void)showError:(NSString *)msg {
   
    [self showMessage:msg image:[UIImage imageNamed:@"YCStatusBarHUD.bundle/error"]];

}
/**
 *  显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg {

    
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    
    // 显示窗口
    [self showWindow];
    
    // 显示文字
    UILabel *label = [[UILabel alloc]init];
    label.font = YCMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    // 添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    // 文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : YCMessageFont}].width;
    CGFloat centenX = (window_.frame.size.width - msgW ) * 0.5 - 20;
    CGFloat centenY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centenX,centenY);
    [loadingView startAnimating];
    [window_ addSubview:loadingView];
}

/**
 *  隐藏
 */
+ (void)hide {
    
    [UIView animateWithDuration:YCAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        // 隐藏
        window_ = nil;
        timer_ = nil;
    }];
   

}
@end
