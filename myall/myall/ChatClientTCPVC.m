//
//  ChatClientTCPVC.m
//  myall
//
//  Created by yue wang on 16/10/13.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "ChatClientTCPVC.h"

@interface ChatClientTCPVC()<NSStreamDelegate>
@end
@implementation ChatClientTCPVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TCP聊天";
    self.view.backgroundColor = [UIColor whiteColor];
        // Do any additional setup after loading the view, typically from a nib.
    
    [self addJoinButton];
    [self addChatButton];
    [self initNetworkCommunication];
    
    self.messages = [[NSMutableArray alloc] init];
}
- (void)initNetworkCommunication {
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"localhost", 80, &readStream, &writeStream);
    self.inputStream = (NSInputStream *)CFBridgingRelease(readStream);
    self.outputStream = (NSOutputStream *)CFBridgingRelease(writeStream);
    [self.inputStream setDelegate:self];
    [self.outputStream setDelegate:self];
    [self.inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [self.outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [self.inputStream open];
    [self.outputStream open];
}
-(void)addJoinButton{
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(50, 100, 80, 40);
    [btn1 setImage:[UIImage imageNamed:@"icon_shouye"] forState:UIControlStateNormal];
    [btn1 setTitle:@"Join" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [btn1 addTarget:self action:@selector(joinAction) forControlEvents:UIControlEventTouchUpInside];
    btn1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btn1];
}

-(void)addChatButton{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 150, 80, 40);
    [btn setImage:[UIImage imageNamed:@"icon_shouye"] forState:UIControlStateNormal];
    [btn setTitle:@"Chat" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor greenColor];    //上左下右
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.frame.size.width - btn.imageView.frame.origin.x - btn.imageView.frame.size.width, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -(btn.frame.size.width - btn.imageView.frame.size.width ), 0, 0);
    [btn addTarget:self action:@selector(chatAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)joinAction{
    NSString *joinname  = @"IreneWang";
    NSString *response  = [NSString stringWithFormat:@"iam:%@", joinname];
    NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
    [self.outputStream write:[data bytes] maxLength:[data length]];
}

-(void)chatAction{
    NSString *message = @"nice to meet you";
    NSString *response  = [NSString stringWithFormat:@"msg:%@", message];
    NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
    [self.outputStream write:[data bytes] maxLength:[data length]];
}

- (void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent {
  /*  typedef enum {
        NSStreamEventNone = 0,
        NSStreamEventOpenCompleted = 1 << 0,
        NSStreamEventHasBytesAvailable = 1 << 1,
        NSStreamEventHasSpaceAvailable = 1 << 2,
        NSStreamEventErrorOccurred = 1 << 3,
        NSStreamEventEndEncountered = 1 << 4
    };*/
    switch (streamEvent) {
            
        case NSStreamEventOpenCompleted:
            NSLog(@"Stream opened");
            break;
            
        case NSStreamEventHasBytesAvailable:
           // NSLog(@"Stream BytesAvailable");
            if (theStream == self.inputStream) {
                
                uint8_t buffer[1024];
                NSInteger len;
                
                while ([self.inputStream hasBytesAvailable]) {
                    len = [self.inputStream read:buffer maxLength:sizeof(buffer)];
                    if (len > 0) {
                        
                        NSString *output = [[NSString alloc] initWithBytes:buffer length:len encoding:NSASCIIStringEncoding];
                        
                        if (nil != output) {
                            NSLog(@"server said: %@", output);
                            [self messageReceived:output];
                        }
                    }
                }
            }
            break;
            
        case NSStreamEventErrorOccurred:
            NSLog(@"Can not connect to the host!");
            break;
            
        case NSStreamEventEndEncountered:
             NSLog(@"Stream Event End!");
            [theStream close];
            [theStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            break;
            
        default:
            NSLog(@"Unknown event");
    }
}

- (void) messageReceived:(NSString *)message {
    
    [self.messages addObject:message];
    NSLog(@"/*------start---------*/");
    NSLog(@"%@",self.messages);
    NSLog(@"/*-------end----------*/");
    
}
@end
