//
//  NSDictionary+Parse.h
//  hemu
//
//  Created by zhouting on 16/3/22.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Parse)
// 获取text值
NSString* getText(NSDictionary* dic, NSString* key);
// 获取Integer值(自动判断数字方式或者文本方式)
NSInteger getIntegerAuto(NSDictionary* dic, NSString* key);
// 获取无符号Int值(自动判断数字方式或者文本方式)
unsigned int getUnsignedIntAuto(NSDictionary* dic, NSString* key);
// 获取bool值(自动判断数字方式或者文本方式)
bool getBoolAuto(NSDictionary* dic, NSString* key);
/// 提取列表元素
NSArray* getList(NSDictionary* dic,NSString* key);
/// 提取NSNumber对象
NSNumber* getNumber(NSDictionary *dic,NSString *key);
@end
