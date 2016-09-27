//
//  TabbarAnimation.m
//  myall
//
//  Created by yue wang on 16/9/27.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "TabbarAnimation.h"
#import "ViewControllerOne.h"
#import "ViewControllerTwo.h"
#import "ViewControllerThree.h"

@interface   TabbarAnimation()
@property (nonatomic,assign) NSInteger indexFlag;


@end

@implementation TabbarAnimation
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"tabbar animation";
       // Do any additional setup after loading the view, typically from a nib.
    
    ViewControllerOne *vc1 = [[ViewControllerOne alloc] init];
    vc1.tabBarItem.title =@"vc1";
    vc1.tabBarItem.image = [UIImage imageNamed:@"icon_shouye"];
    
    ViewControllerTwo *vc2 = [[ViewControllerTwo alloc] init];
    vc2.tabBarItem.title =@"vc2";
    vc2.tabBarItem.image = [UIImage imageNamed:@"icon_shouye"];

    ViewControllerThree *vc3 = [[ViewControllerThree alloc] init];
    vc3.tabBarItem.title =@"vc3";
    vc3.tabBarItem.image = [UIImage imageNamed:@"icon_shouye"];

    self.viewControllers = @[vc1,vc2,vc3];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSInteger index = [self.tabBar.items indexOfObject:item];
    
    if (self.indexFlag != index) {
        [self animationWithIndex:index];
    }
    
}
// 动画
- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.08;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.7];
    pulse.toValue= [NSNumber numberWithFloat:1.3];
    [[tabbarbuttonArray[index] layer]
     addAnimation:pulse forKey:nil];
    
    self.indexFlag = index;
    
}

@end
