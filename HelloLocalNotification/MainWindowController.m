//
//  MainWindowController.m
//  HelloLocalNotification
//
//  Created by Bear on 2014/4/6.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import "MainWindowController.h"

@interface MainWindowController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation MainWindowController

- (void)dealloc
{
    [self stopTimer];
}

/*
 * 顯示通知
 */
- (void)notificate
{
    // 取得設定的訊息
    NSString *message = self.messageTextField.stringValue;
    
    // 建立新的通知，並設定標題
    NSUserNotification *notification = [[NSUserNotification alloc] init];
    [notification setTitle:@"HelloLocalNotification"];
    
    // 設定通知的訊息，與通知音效
    [notification setInformativeText:message];
    [notification setSoundName:NSUserNotificationDefaultSoundName];
    
    // 取得通知中心，發出通知
    NSUserNotificationCenter *center = [NSUserNotificationCenter defaultUserNotificationCenter];
    [center deliverNotification:notification];
    
    // 解除欄位鎖定
    [self settingEditable:YES];
    [self.button setState:NSOffState];
}

/*
 * 建立計時器，依設定的秒數延遲通知
 */
- (void)settingTimer
{
    long timeInterval = self.timerSlider.integerValue;
    NSLog(@"%ld", timeInterval);
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(notificate) userInfo:nil repeats:NO];
}

/*
 * 移除計時器
 */
- (void)stopTimer
{
    bool isValid = [self.timer isValid];
    
    if(isValid) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

/*
 * 設定輸入欄位鎖定狀態
 */
- (void)settingEditable:(BOOL)boolean
{
    [self.messageTextField setEditable:boolean];
    [self.timerSlider setEnabled:boolean];
}

/*
 * 執行或停止
 */
- (IBAction)clicked:(id)sender
{
    NSButton *btn = sender;
    
    if([btn state] == NSOnState) {
        // lock
        [self settingEditable:NO];
        [self settingTimer];
    }
    else {
        // unlock
        [self settingEditable:YES];
        [self stopTimer];
    }
}

@end
