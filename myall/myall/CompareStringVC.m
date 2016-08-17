//
//  CompareStringVC.m
//  myall
//
//  Created by yue wang on 16/8/17.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "CompareStringVC.h"
#import "HealthRecord.h"
@implementation CompareStringVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self compareTwoStringFindEqualNumberText1:@"aabbccdef" text2:@"sadhellojsad"];
    [self findEqualNumberAndSubstringFromText1:@"aabbccdef" text2:@"sadhellojsad"];
    [self sortProperty];
    [self reverseArray];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)compareTwoStringFindEqualNumberText1:(NSString *)text1 text2:(NSString *)text2{
    int count =0;
    NSMutableSet *healthNameMutSet = [NSMutableSet new];
    for (int i=0; i<text1.length; i++) {
        unichar c = [text1 characterAtIndex:i];
        [healthNameMutSet addObject:[NSString stringWithFormat:@"%c",c]];
    }
    //NSSet *healthNameSet = [NSSet setWithArray:[healthNameArray copy]];
    
    
    //NSMutableArray *resultArray=[NSMutableArray new];
    NSMutableSet *resultMutSet = [NSMutableSet new];
    for (int i=0; i<text2.length; i++) {
        unichar c = [text2 characterAtIndex:i];
        [resultMutSet addObject:[NSString stringWithFormat:@"%c",c]];
    }
    // NSSet *resultSet = [NSSet setWithArray:[resultArray copy]];
    
    //  NSArray *resultArr = [resultSet allObjects];
    //  NSArray *healthNameArr = [healthNameSet allObjects];
    
    
    for (NSString *c in resultMutSet) {
        for (NSString *cr in healthNameMutSet) {
            if ([c isEqualToString:cr]) {
                count++;
            }
        }
    }
    NSLog(@"count %d",count);

}

-(NSMutableSet *)findEqualNumberAndSubstringFromText1:(NSString *)text1 text2:(NSString *)text2{
    NSMutableSet *arr3 = [NSMutableSet set];
    
    [text1 enumerateSubstringsInRange:NSMakeRange(0, text1.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        NSRange temp = [text2 rangeOfString:substring];
        if (temp.location != NSNotFound) {
            [arr3 addObject:substring];
        }
    }];
    
    NSLog(@"%@ num:%ld",arr3,arr3.count);
    return arr3;
}

-(void)sortProperty{
    NSDictionary *dic1 = @{@"explain":@"explainValue",@"className":@"classNameValue",@"code":@"codeValue",@"symptoms":@"symptomsValue",@"benefit":@"benefitValue",@"harm":@"harmValue",@"Name":@"NameValue",@"classCode":@"classCodeValue",@"matchedCount":[NSNumber numberWithInt:1]};
    HealthRecord *record1 = [[HealthRecord alloc] initWithparserDictionary:dic1];
    
    NSDictionary *dic2 = @{@"explain":@"explainValue",@"className":@"classNameValue",@"code":@"codeValue",@"symptoms":@"symptomsValue",@"benefit":@"benefitValue",@"harm":@"harmValue",@"Name":@"NameValue",@"classCode":@"classCodeValue",@"matchedCount":[NSNumber numberWithInt:3]};
    HealthRecord *record2 = [[HealthRecord alloc] initWithparserDictionary:dic2];
    
    NSDictionary *dic3 = @{@"explain":@"explainValue",@"className":@"classNameValue",@"code":@"codeValue",@"symptoms":@"symptomsValue",@"benefit":@"benefitValue",@"harm":@"harmValue",@"Name":@"NameValue",@"classCode":@"classCodeValue",@"matchedCount":[NSNumber numberWithInt:2]};
    HealthRecord *record3 = [[HealthRecord alloc] initWithparserDictionary:dic3];
    
    NSDictionary *dic4 = @{@"explain":@"explainValue",@"className":@"classNameValue",@"code":@"codeValue",@"symptoms":@"symptomsValue",@"benefit":@"benefitValue",@"harm":@"harmValue",@"Name":@"NameValue",@"classCode":@"classCodeValue",@"matchedCount":[NSNumber numberWithInt:4]};
    HealthRecord *record4 = [[HealthRecord alloc] initWithparserDictionary:dic4];
    
    NSDictionary *dic5 = @{@"explain":@"explainValue",@"className":@"classNameValue",@"code":@"codeValue",@"symptoms":@"symptomsValue",@"benefit":@"benefitValue",@"harm":@"harmValue",@"Name":@"NameValue",@"classCode":@"classCodeValue",@"matchedCount":[NSNumber numberWithInt:0]};
    HealthRecord *record5 = [[HealthRecord alloc] initWithparserDictionary:dic5];
    
    NSArray *array = [NSArray arrayWithObjects:record1, record2, record3, record4, record5,nil];
    for (HealthRecord *rec in array) {
        NSLog(@"array rec count:%@", rec.matchedCount);
    }
    NSSortDescriptor *sortD = [NSSortDescriptor sortDescriptorWithKey:@"matchedCount" ascending:NO];
    NSArray * array2 = [array sortedArrayUsingDescriptors:@[sortD]];
    
    for (HealthRecord *rec in array2) {
         NSLog(@"array2 rec count:%@", rec.matchedCount);
    }
    
}

-(void)reverseArray{
    NSArray *array = [NSArray arrayWithObjects:@"a", @"b", @"c", @"d", @"e",nil];

    NSArray* reversedArray = [[array  reverseObjectEnumerator] allObjects];
    for (NSString *rec in reversedArray) {
        NSLog(@"reversedArray:%@", rec);
    }
}
@end
