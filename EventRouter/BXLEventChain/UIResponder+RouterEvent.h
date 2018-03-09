//
//  UIResponder+RouterEvent.h
//  iOSClient
//
//  Created by leven on 2018/2/28.
//  Copyright © 2018年 borderxlab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (RouterEvent)

/**
 UIResponder类重写该方法，可以获取视图链上分发的所有事件 见 ‘UIView+RouterEvent’文件
 @param eventName 事件名字
 @param params 事件参数
 */
- (BOOL)observeEvent:(NSString *)eventName params:(id)params;

@end
