# YCStatusBarHUD

一个简单易用的状态栏指示器框架

## 1、Cocoapod 支持

Podfile文件里面输入
`pod 'YCStatusBarHUD'`

执行 
`pod install`


## 2、使用说明

### 普通显示

```objc
[YCStatusBarHUD showMessage:@"普通文字"];
```
   
### 正在加载

```objc
[YCStatusBarHUD showLoading:@"正在加载"];
```

### 加载成功
```objc
[YCStatusBarHUD showSuccess:@"成功"]
```

### 加载失败
```objc
[YCStatusBarHUD showError:@"失败"];
```

### 隐藏
```objc
[YCStatusBarHUD hide];
```


