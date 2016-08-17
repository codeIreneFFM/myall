//
//  HealthRecord.m
//  mobilehealth
//
//  Created by yue wang on 16/7/23.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "HealthRecord.h"
#import "NSDictionary+Parse.h"
@implementation HealthRecord
- (instancetype)initWithparserDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        _explain =  getText(dic, @"explain");
        _className = getText(dic, @"className");
        _code =  getText(dic, @"code");
        _symptoms = getText(dic, @"symptoms");
        _benefit =  getText(dic, @"benefit");
        _harm = getText(dic, @"harm");
        _Name =  getText(dic, @"Name");
        _classCode = getText(dic, @"classCode");
        _indicator =  getText(dic, @"indicator");
        _matchedCount = getNumber(dic, @"matchedCount");
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_explain forKey:@"explain"];
    [aCoder encodeObject:_className forKey:@"className"];
    [aCoder encodeObject:_code forKey:@"code"];
    [aCoder encodeObject:_symptoms forKey:@"symptoms"];
    [aCoder encodeObject:_benefit forKey:@"benefit"];
    [aCoder encodeObject:_harm forKey:@"harm"];
    [aCoder encodeObject:_Name forKey:@"Name"];
    [aCoder encodeObject:_classCode forKey:@"classCode"];
    [aCoder encodeObject:_indicator forKey:@"indicator"];
    [aCoder encodeObject:_matchedCount forKey:@"matchedCount"];
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _explain = [aDecoder decodeObjectForKey:@"explain"];
        _className = [aDecoder decodeObjectForKey:@"className"];
        _code = [aDecoder decodeObjectForKey:@"code"];
        _symptoms = [aDecoder decodeObjectForKey:@"symptoms"];
        _benefit = [aDecoder decodeObjectForKey:@"benefit"];
        _harm = [aDecoder decodeObjectForKey:@"harm"];
        _Name = [aDecoder decodeObjectForKey:@"Name"];
        _classCode = [aDecoder decodeObjectForKey:@"classCode"];
        _indicator = [aDecoder decodeObjectForKey:@"indicator"];
        _matchedCount = [aDecoder decodeObjectForKey:@"matchedCount"];
    }
    return self;
}

@end
