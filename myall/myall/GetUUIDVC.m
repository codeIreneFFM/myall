//
//  GetUUIDVC.m
//  myall
//
//  Created by yue wang on 16/9/2.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "GetUUIDVC.h"
#import "JNKeychain.h"

static NSString * const KeyUUID = @"KeyUUID";
@implementation GetUUIDVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title= @"报告查询";
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *UUID = [self getDeviceIdentifier];
    NSLog(@"UUID = %@",UUID);
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}

@end
