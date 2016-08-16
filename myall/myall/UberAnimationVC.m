//
//  UberAnimationVC.m
//  myall
//
//  Created by yue wang on 16/8/16.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "UberAnimationVC.h"
#import "Constants.h"
@interface UberAnimationVC()
@property (nonatomic,strong) CAShapeLayer *circleLayer;
@end
@implementation UberAnimationVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addCirclelayer];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)addCirclelayer{
    //step1 准备演员
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(MainScreen_width/2-50, 150, 100, 100)];
    [self.view addSubview:demoView];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
    shapeLayer.frame = demoView.bounds;
//    shapeLayer.strokeEnd = 0.7f;
//    shapeLayer.strokeStart = 0.1f;
    CGFloat radius = 50.0f;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius: radius/2 startAngle:-M_PI_2 endAngle:3*M_PI_2 clockwise:true];//[UIBezierPath bezierPathWithOvalInRect:demoView.bounds];
    
    shapeLayer.path = path.CGPath;
    
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = radius;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    [demoView.layer addSublayer:shapeLayer];
    
    //step2: 准备剧本(配置CABasicAnimation)
    CABasicAnimation *stroke =  [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    stroke.fromValue = @(0);
    stroke.toValue = @(1);
    stroke.repeatCount = 1;
    stroke.duration = 2.0f;
    stroke.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
//    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];//keyPath不能填错，有特定被选值
//    CATransform3D startingTransform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
//    startingTransform = CATransform3DScale(startingTransform, 0.25, 0.25, 1);
//    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:startingTransform]; // startingTransform;
//    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
//    scaleAnimation.autoreverses = NO;
//    //  scaleAnimation.fillMode = kCAFillModeForwards;
//    scaleAnimation.removedOnCompletion = NO;
//    scaleAnimation.repeatCount = 1;
//    scaleAnimation.duration = 2.0f;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];//keyPath不能填错，有特定被选值
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.autoreverses = NO;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.repeatCount = 1;
    scaleAnimation.duration = 2.0f;
    
    
    CAAnimationGroup *groupAnnimation = [CAAnimationGroup animation];
    groupAnnimation.duration = 2.0f;
    groupAnnimation.autoreverses = NO;
    groupAnnimation.animations = @[stroke, scaleAnimation];
    groupAnnimation.repeatCount = 1;
    //step3: 开演
    [shapeLayer addAnimation:groupAnnimation forKey:@"strokeEndAnimation"];
}
@end
