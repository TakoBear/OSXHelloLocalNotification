//
//  MainWindowController.h
//  HelloLocalNotification
//
//  Created by Bear on 2014/4/6.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainWindowController : NSWindowController

// 用來取得設定值：通知訊息、延遲秒數
@property (nonatomic, weak) IBOutlet NSTextField *messageTextField;
@property (nonatomic, weak) IBOutlet NSSlider *timerSlider;
@property (nonatomic, weak) IBOutlet NSButton *button;

@end
