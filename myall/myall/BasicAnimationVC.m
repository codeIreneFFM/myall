//
//  BasicAnimationVC.m
//  myall
//
//  Created by yue wang on 16/8/9.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "BasicAnimationVC.h"
@interface BasicAnimationVC ()
@property (nonatomic,strong)UIImageView *imageView;
@end
@implementation BasicAnimationVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addHeartBeatAnimation];
    [self addGroupAnimation];
    [self addTranslationAnimation];
}

-(void)addHeartBeatAnimation{
    //step1: 准备演员(CALayer初始化)
    CGFloat kYOffset = 10;
    CALayer *scaleLayer = [[CALayer alloc] init];
    scaleLayer.backgroundColor = [UIColor blueColor].CGColor;
    scaleLayer.frame = CGRectMake(60, 64 + kYOffset, 50, 50);
    scaleLayer.cornerRadius = 10;
    [self.view.layer addSublayer:scaleLayer];
    
    //step2: 准备剧本(配置CABasicAnimation)
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];//keyPath不能填错，有特定被选值
                                        scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
                                        scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
                                        scaleAnimation.autoreverses = YES;
                                        scaleAnimation.fillMode = kCAFillModeForwards;
                                        scaleAnimation.removedOnCompletion = NO;
                                        scaleAnimation.repeatCount = MAXFLOAT;
                                        scaleAnimation.duration = 0.8;
     //step3: 开演
    [scaleLayer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}


-(void)addGroupAnimation{
    CALayer *groupLayer = [[CALayer alloc] init];
    groupLayer.backgroundColor = [UIColor purpleColor].CGColor;
    groupLayer.frame = CGRectMake(60, 64 + 10+ 60, 50, 50);
    groupLayer.cornerRadius = 10;
    [self.view.layer addSublayer:groupLayer];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.duration = 0.8;
    
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.fromValue = [NSValue valueWithCGPoint:groupLayer.position];
    moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(320 - 80, groupLayer.position.y)];
    moveAnimation.autoreverses = YES;
    moveAnimation.repeatCount = MAXFLOAT;
    moveAnimation.duration = 2;
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
    rotateAnimation.autoreverses = YES;
    rotateAnimation.repeatCount = MAXFLOAT;
    rotateAnimation.duration = 2;
    
    CAAnimationGroup *groupAnnimation = [CAAnimationGroup animation];
    groupAnnimation.duration = 2;
    groupAnnimation.autoreverses = YES;
    groupAnnimation.animations = @[moveAnimation, scaleAnimation, rotateAnimation];
    groupAnnimation.repeatCount = MAXFLOAT;
    
    
    [groupLayer addAnimation:groupAnnimation forKey:@"groupAnnimation"];
}

-(void)addTranslationAnimation{
    CALayer *translationLayer = [[CALayer alloc] init];
    translationLayer.backgroundColor = [UIColor yellowColor].CGColor;
    translationLayer.frame = CGRectMake(60, 64 + 10+ 60+70, 50, 50);
    translationLayer.cornerRadius = 10;
    [self.view.layer addSublayer:translationLayer];

    
    /* 动画1（在X轴方向移动） */
    CABasicAnimation *animation1 =[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    
    // 终点设定
    animation1.toValue = [NSNumber numberWithFloat:80];; // 終点
    animation1.autoreverses= YES;
    animation1.repeatCount = MAXFLOAT;
    animation1.duration = 2;
    
    [translationLayer addAnimation:animation1 forKey:@"translationAnimation"];
}
@end
