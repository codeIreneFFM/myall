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
    [self.navigationController.navigationBar setBarTintColor:[@"#3cc283" cmcciotHexColor]];
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
