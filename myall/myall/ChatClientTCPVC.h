//
//  ChatClientTCPVC.h
//  myall
//
//  Created by yue wang on 16/10/13.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ChatClientTCPVC : BaseViewController
@property (nonatomic,strong) NSInputStream *inputStream;
@property (nonatomic,strong) NSOutputStream *outputStream;
@property (nonatomic,strong) NSMutableArray * messages;
@end
