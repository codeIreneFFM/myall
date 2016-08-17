//
//  HealthRecord.h
//  mobilehealth
//
//  Created by yue wang on 16/7/23.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthRecord : NSObject<NSCoding>
@property (nonatomic,strong) NSString *explain;
@property (nonatomic,strong) NSString *className;
@property (nonatomic,strong) NSString *code;
@property (nonatomic,strong) NSString *symptoms;
@property (nonatomic,strong) NSString *benefit;
@property (nonatomic,strong) NSString *harm;
@property (nonatomic,strong) NSString *Name;
@property (nonatomic,strong) NSString *classCode;
@property (nonatomic,strong) NSString *indicator;
@property (nonatomic,strong) NSNumber *matchedCount ;
- (instancetype)initWithparserDictionary:(NSDictionary *)dic;
@end
