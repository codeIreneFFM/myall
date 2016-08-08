//
//  JumpAnimationVC.m
//  myall
//
//  Created by yue wang on 16/8/8.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "JumpAnimationVC.h"
@interface JumpAnimationVC()
@property (nonatomic,strong) UIImageView *indicatorArrowImageView;
@end

@implementation JumpAnimationVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addIndicatorView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)addIndicatorView{
    CGRect frame= CGRectMake((self.view.frame.size.width-200)/2, (self.view.frame.size.height-100)/2, 200, 100);
    CGFloat imageWidth=30;
    CGFloat imageHeight = 30;
    CGFloat x = frame.origin.x + frame.size.width/2;
    CGFloat y = frame.origin.y - imageHeight+20;
    self.indicatorArrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, imageWidth, imageHeight)];
    self.indicatorArrowImageView.image = [UIImage imageNamed:@"IndicatorArrow"];
    [self.view addSubview:self.indicatorArrowImageView];
    
    CGPoint originPos = CGPointZero;
    CGSize originSize = CGSizeZero;
    
    if ([self.indicatorArrowImageView.layer isKindOfClass:[CALayer class]]) {
        originPos = [(CALayer *)self.indicatorArrowImageView.layer position];
        originSize = [(CALayer *)self.indicatorArrowImageView.layer bounds].size;
    }
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    //改变value来实现不同方向的震动
    CGFloat offsetX = 0;
    CGFloat offsetY = 0;
    
    offsetY = 10.0;
    
    animation.values = @[
                         [NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y)],
                         [NSValue valueWithCGPoint:CGPointMake(originPos.x-offsetX, originPos.y-offsetY)],
                         [NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y)],
                         [NSValue valueWithCGPoint:CGPointMake(originPos.x+offsetX, originPos.y+offsetY)],
                         [NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y)]
                         ];
    animation.repeatCount = MAXFLOAT;
    animation.duration = 0.5;
    animation.fillMode = kCAFillModeForwards;
    [self.indicatorArrowImageView.layer addAnimation:animation forKey:@"animation"];
    
}

@end
