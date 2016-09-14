//
//  GetUUIDVC.m
//  myall
//
//  Created by yue wang on 16/9/2.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "GetUUIDVC.h"
#import "JNKeychain.h"
#import "Constants.h"
static NSString * const KeyUUID = @"KeyUUID";
@implementation GetUUIDVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title= @"获取UUID";
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *UUID = [self getDeviceIdentifier];
    NSLog(@"UUID = %@",UUID);
    
    [self addNormalButton];
    [self addButtonWithImageOnRight];
    [self addButtonTopDown];
    [self addCircleView];
    [self getSystemPara];
}
-(NSString *)getDeviceIdentifier{
    
    NSString * currentDeviceUUIDStr = [JNKeychain loadValueForKey:KeyUUID];
    if (currentDeviceUUIDStr == nil || [currentDeviceUUIDStr isEqualToString:@""])
    {
        NSUUID * currentDeviceUUID  = [UIDevice currentDevice].identifierForVendor;
        currentDeviceUUIDStr = currentDeviceUUID.UUIDString;
        currentDeviceUUIDStr = [currentDeviceUUIDStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
        currentDeviceUUIDStr = [currentDeviceUUIDStr lowercaseString];
        [JNKeychain saveValue:currentDeviceUUIDStr forKey:KeyUUID];
    }
    return currentDeviceUUIDStr;
}

-(void)addNormalButton{
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(50, 100, 80, 40);
    [btn1 setImage:[UIImage imageNamed:@"icon_shouye"] forState:UIControlStateNormal];
    [btn1 setTitle:@"首页" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn1];
}

-(void)addButtonWithImageOnRight{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 150, 80, 40);
    [btn setImage:[UIImage imageNamed:@"icon_shouye"] forState:UIControlStateNormal];
    [btn setTitle:@"首页" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];    //上左下右
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.frame.size.width - btn.imageView.frame.origin.x - btn.imageView.frame.size.width, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -(btn.frame.size.width - btn.imageView.frame.size.width ), 0, 0);
       [self.view addSubview:btn];
}


-(void)addButtonTopDown{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 200, 80, 60);
    [btn setImage:[UIImage imageNamed:@"icon_shouye"] forState:UIControlStateNormal];
    [btn setTitle:@"首页的事" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    
    btn.imageEdgeInsets = UIEdgeInsetsMake(- (btn.frame.size.height - btn.titleLabel.frame.size.height- btn.titleLabel.frame.origin.y),(btn.frame.size.width -btn.titleLabel.frame.size.width)/2.0f -btn.imageView.frame.size.width, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(btn.frame.size.height-btn.imageView.frame.size.height-btn.imageView.frame.origin.y, -btn.imageView.frame.size.width, 0, 0);
    [self.view addSubview:btn];
}

-(void)addCircleView{
    _headerCircle = [[CLHeaderCircleView alloc] initWithFrame:CGRectMake(50, 300, 80, 60)];
    //_headerCircle.delegate = self;
    [self.view addSubview:_headerCircle];

}

-(void)getSystemPara{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"currentVersion = %@",currentVersion);
    
    NSString *displayName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    NSLog(@"displayName = %@",displayName);
    
    NSString *bundleVersion = [infoDictionary objectForKey:@"CFBundleVersion"];
    NSLog(@"bundleVersion = %@",bundleVersion);
}
/*关于setTitleEdgeInsets和setImageEdgeInsets下面进行一些解释：
UIButton内有两个控件titleLabel和imageView，可以用来显示一个文本和图片，这里的图片区别于背景图片。给UIButton设置了title和image后，它们会图片在左边，文本在图片右边显示。它们两个做为一个整体依赖于button的contentHorizontalAlignment居左居右或居中显示。

显示格式区分：
1.当button.width < image.width时，只显示被压缩后的图片，图片是按照fillXY的方式压缩。
2.当button.width > image.width，且button.width < (image.width+text.width)时，图片正常显示，文本被压缩。
3.当button.width > (image.width+text.width)时，两者并列默认居中显示，可通过button的属性contentHorizontalAlignment改变对齐方式。

想改变两个子控件的显示位置，可以分别通过setTitleEdgeInsets和setImageEdgeInsets来实现。对titleLabel和imageView设置偏移是针对他当前的位置起作用的，并不是针对距离button边框的距离的。

typedefNS_ENUM(NSInteger, UIControlContentHorizontalAlignment) {
    UIControlContentHorizontalAlignmentCenter =0,//居中
    UIControlContentHorizontalAlignmentLeft   =1,//居左
    UIControlContentHorizontalAlignmentRight  =2,//居右
    UIControlContentHorizontalAlignmentFill   =3,//
    
    想两改变两个子控件的显示位置，可以分别通过setTitleEdgeInsets和setImageEdgeInsets来实现。需要注意的是，对titleLabel和imageView设置偏移，是针对它当前的位置起作用的，并不是针对它距离button边框的距离的。感觉设置不设置UIControlContentHorizontalAlignmentCenter居中都没有影响，这个网上也找了些相关的信息，感觉都没有说到重点，我这里也没有完全理解透彻，之前都是在设置setTitleEdgeInsets和setImageEdgeInsets这些参数时都是不停的尝试得到的结果。目前这是我理解后，代码实现最后的答案，希望可以帮到大家。
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}

@end
