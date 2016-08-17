//
//  NSDictionary+Parse.m
//  hemu
//
//  Created by zhouting on 16/3/22.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "NSDictionary+Parse.h"

@implementation NSDictionary (Parse)
// 获取text值
NSString* getText(NSDictionary* dic, NSString* key) {
    if (dic && [dic isKindOfClass:[NSDictionary class]]&& key) {
        id val = [dic objectForKey:key];
        if (val) {
            if ([val isKindOfClass:[NSString class]]) {
                return val;
            }
            else if ([val isKindOfClass:[NSNumber class]]) {
                return [NSString stringWithFormat:@"%@", val];
            }
        }
    }
    //    return nil;
    return @"";
}

// 获取Integer值(自动判断数字方式或者文本方式)
NSInteger getIntegerAuto(NSDictionary* dic, NSString* key) {
    if (dic && [dic isKindOfClass:[NSDictionary class]]&& key) {
        id valObj = [dic objectForKey:key];
        if (valObj) {
            if ([valObj isKindOfClass:[NSNumber class]]) { // 数字方式
                NSNumber* numObj = (NSNumber*)valObj;
                return numObj.integerValue;
            }
            else if ([valObj isKindOfClass:[NSString class]]) { // 文本方式
                NSString* strObj = (NSString*)valObj;
                return strObj.integerValue;
            }
        }
    }
    return 0;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-function"
// 获取Double值(自动判断数字方式或者文本方式)
double getDoubleAuto(NSDictionary* dic, NSString* key) {
    if (dic && [dic isKindOfClass:[NSDictionary class]]&& key) {
        id valObj = [dic objectForKey:key];
        if (valObj) {
            if ([valObj isKindOfClass:[NSNumber class]]) { // 数字方式
                NSNumber* numObj = (NSNumber*)valObj;
                return numObj.doubleValue;
            }
            else if ([valObj isKindOfClass:[NSString class]]) { // 文本方式
                NSString* strObj = (NSString*)valObj;
                return strObj.doubleValue;
            }
        }
    }
    return 0;
}
#pragma clang diagnostic pop

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-function"
// 获取Int值(自动判断数字方式或者文本方式)
unsigned int getUnsignedIntAuto(NSDictionary* dic, NSString* key) {
    if (dic && [dic isKindOfClass:[NSDictionary class]]&& key) {
        id valObj = [dic objectForKey:key];
        if (valObj) {
            if ([valObj isKindOfClass:[NSNumber class]]) { // 数字方式
                NSNumber* numObj = (NSNumber*)valObj;
                return numObj.unsignedIntValue;
            }
            else if ([valObj isKindOfClass:[NSString class]]) { // 文本方式
                NSString* strObj = (NSString*)valObj;
                return ((unsigned int)strObj.intValue);
            }
        }
    }
    return 0;
}
// 获取bool值(自动判断数字方式或者文本方式)
bool getBoolAuto(NSDictionary* dic, NSString* key) {
    if (dic && [dic isKindOfClass:[NSDictionary class]]&& key) {
        id valObj = [dic objectForKey:key];
        if (valObj) {
            if ([valObj isKindOfClass:[NSNumber class]]) { // 数字方式
                NSNumber* numObj = (NSNumber*)valObj;
                return numObj.boolValue;
            }
            else if ([valObj isKindOfClass:[NSString class]]) { // 文本方式
                NSString* strObj = (NSString*)valObj;
                return (strObj.boolValue);
            }
        }
    }
    return 0;
}
/// 提取列表元素
NSArray* getList(NSDictionary* dic,NSString* key)
{
    if (dic && [dic isKindOfClass:[NSDictionary class]]&& key) {
        id valObj = [dic objectForKey:key];
        if (valObj) {
            if ([valObj isKindOfClass:[NSArray class]]) {
                NSArray* obj = (NSArray*)valObj;
                return obj;
            }
        }
    }
    return nil;
}
/// 提取NSNumber对象
NSNumber* getNumber(NSDictionary *dic,NSString *key)
{
    if (dic && [dic isKindOfClass:[NSDictionary class]]&& key) {
        id valObj = [dic objectForKey:key];
        if (valObj) {
            if ([valObj isKindOfClass:[NSNumber class]]) { // 数字方式
                NSNumber* numObj = (NSNumber*)valObj;
                return numObj;
            }
            else if ([valObj isKindOfClass:[NSString class]]) { // 文本方式
                NSString* strObj = (NSString*)valObj;
                NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
                NSNumber * numObj = [f numberFromString:strObj];
                if (numObj) {
                    return numObj;
                }
                return [NSNumber numberWithInteger:[strObj integerValue]];
            }

        }
    }
    return nil;
}
@end
