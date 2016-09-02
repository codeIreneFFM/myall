//
//  MethodsListViewController.m
//  CmiotSDKApp
//
//  Created by yue wang on 16/8/1.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "MethodsListViewController.h"
#import "JumpAnimationVC.h"
#import "LoadWebVC.h"
#import "ViewController.h"
#import "BasicAnimationVC.h"
#import "BoomAnimationVC.h"
#import "ShoppingVC.h"
#import "UberAnimationVC.h"
#import "CompareStringVC.h"
#import "GetUUIDVC.h"
@interface MethodsListViewController()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *methods;
@end
@implementation MethodsListViewController
- (void)viewDidLoad {
   [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.methods = @[@"上下跳动动画",@"加载webview",@"定制回退按钮和导航栏颜色,纯色image",@"基础动画",@"爆炸动画",@"购物页面",@"uber动画",@"比较字符串，属性排序,倒序",@"拉起应用",@"获取UUID"];

}
#pragma mark - Table view datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;//返回标题数组中元素的个数来确定分区的个数
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.methods.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellId = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
   
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.text =self.methods[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"didSelectRow:%ld",(long)indexPath.row);
    if (indexPath.row==0){
        JumpAnimationVC *vc = [[JumpAnimationVC alloc] init];
        //设置返回按钮
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, 1)
                                                             forBarMetrics:UIBarMetricsDefault];
        backItem.title = @"退回";
        self.navigationItem.backBarButtonItem = backItem;
      
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        LoadWebVC *vc = [[LoadWebVC alloc] init];
        //回退按钮的title隐藏
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                             forBarMetrics:UIBarMetricsDefault];
        [self.navigationController pushViewController:vc animated:YES];
    
    }else if (indexPath.row == 2){
        ViewController *vc = [[ViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
       
    }else if (indexPath.row == 3){
        BasicAnimationVC *vc = [[BasicAnimationVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        BoomAnimationVC *vc = [[BoomAnimationVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row ==5){
        ShoppingVC *vc = [[ShoppingVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];

    }else if (indexPath.row ==6){
        UberAnimationVC *vc = [[UberAnimationVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row ==7){
        CompareStringVC *vc = [[CompareStringVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row ==8){
        
        NSURL *url = [NSURL URLWithString:@"lecam://"];
        
        if ([[UIApplication sharedApplication] canOpenURL:url]) {//检测已经安装
            [[UIApplication sharedApplication] openURL:url];
        }
        
    }else if (indexPath.row ==9){
        
        GetUUIDVC *vc = [[GetUUIDVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }

   
    
}




@end
