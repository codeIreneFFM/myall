//
//  LoadWebVC.m
//  myall
//
//  Created by yue wang on 16/8/8.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "LoadWebVC.h"
#import "SVProgressHUD.h"
@interface LoadWebVC ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webview;
@end
@implementation LoadWebVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title= @"报告查询";
    self.view.backgroundColor = [UIColor whiteColor];
    self.webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.webview.backgroundColor = [UIColor whiteColor];
    self.webview.delegate = self;
    self.webview.scalesPageToFit=YES;
    self.webview.scrollView.bounces = NO;
    self.webview.contentMode = UIViewContentModeScaleAspectFit;
    //  self.webview = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.webview];
    
    NSString *urlstring = @"http://www.baidu.com";
    NSURL *url =[[NSURL alloc] initWithString:urlstring];
    NSURLRequest *request =  [[NSURLRequest alloc] initWithURL:url];
    [self.webview loadRequest:request];
    
    //  [self.webview loadHTMLString:html baseURL:url];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

}
#pragma mark WebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"加载中");
  [SVProgressHUD showWithStatus:@"拼命加载中"];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [SVProgressHUD dismiss];
    NSLog(@"加载完毕");
    //    NSString *jsCommand = [NSString stringWithFormat:@"document.body.style.zoom = 1.2;"];
    //    [webView stringByEvaluatingJavaScriptFromString:jsCommand];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
