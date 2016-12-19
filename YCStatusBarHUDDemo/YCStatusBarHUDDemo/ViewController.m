//
//  ViewController.m
//  YCStatusBarHUD
//
//  Created by 任任义春 on 16/5/31.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "ViewController.h"
#import "YCStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 1.0 完毕




    


    // 开发1，2功能
    
    


}

- (IBAction)message:(id)sender {
    [YCStatusBarHUD showMessage:@"普通文字"];
    
}

- (IBAction)loading:(id)sender {
    
    [YCStatusBarHUD showLoading:@"正在加载"];
}

- (IBAction)success:(id)sender {
    
    [YCStatusBarHUD showSuccess:@"成功"];
}


- (IBAction)error:(id)sender {
    [YCStatusBarHUD showError:@"失败"];
}

- (IBAction)hide:(id)sender {
    [YCStatusBarHUD hide];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //        [YCStatusBarHUD showSuccess:@"加载成功"];
    //        [YCStatusBarHUD showError:@"加载成功"];
    //        [YCStatusBarHUD showLoading:@"正在加载..."];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
