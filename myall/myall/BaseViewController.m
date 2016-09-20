//
//  BaseViewController.m
//  myall
//
//  Created by yue wang on 16/8/8.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "BaseViewController.h"
#import "NSString+ColorCategory.h"
@interface BaseViewController ()

@end
@implementation BaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBar];
}
- (void)setNavigationBar
{
    [self.navigationController.navigationBar setBarTintColor:[@"#3debc5" cmcciotHexColor]];//[@"#3cc283" cmcciotHexColor]];
    self.navigationController.navigationBar.barStyle = UIBaselineAdjustmentNone;//隐藏navigationbar 下面的横线
    /*网上另外一个方法是说那个横线其实是navigation bar 的背景线，navigationBar的shadowImage，所以只要设置它为空即可，但是设置它为空之前应该先设置它的背景也为空，全部代码如下：
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
     既然导航栏的那一横线能去除，那tabbar那一横线也是能去除的了（其实也是shadowImage来的）···
     方法一：
     
     自定义UITabBarController
     方法二：
     
     [self.tabBarController.tabBar setBackgroundImage:[UIImage new]];
     [self.tabBarController.tabBar setShadowImage:[UIImage new]];
     
     反之，如果我们想自定义那一横线的颜色也是可以的，只要设置它的shadowImage即可。*/
    NSDictionary * dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    UIButton *_backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _backBtn.frame = CGRectMake(0, 0, 50, 40);
    UIImage *backImage = [UIImage imageNamed:@"arrow_back_n"];
    backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_backBtn setImage:backImage forState:UIControlStateNormal];
    [_backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    [_backBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    [_backBtn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [_backBtn setTitle:@"  " forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:_backBtn];
    self.navigationItem.leftBarButtonItem = buttonItem;
}
- (void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
