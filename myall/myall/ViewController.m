//
//  ViewController.m
//  myall
//
//  Created by yue wang on 16/8/8.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"
@interface ViewController ()
@property (nonatomic,strong)UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"test";
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 200, 200)];
    self.imageView.image = [self getImageFromColor:[UIColor darkGrayColor]];
    [self.view addSubview:self.imageView];

    // Do any additional setup after loading the view, typically from a nib.
}
- (UIImage *)getImageFromColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(50, 50, 200, 200);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); return img;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
