//
//  UIView+RouterEvent.h
//  iOSClient
//
//  Created by leven on 2018/2/28.
//  Copyright © 2018年 borderxlab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIResponder+RouterEvent.h"

@interface UIView (RouterEvent)
@property (nonatomic, readonly) UIViewController *topVC;
/**
 分发事件给所有的子类视图链

 @param eventName 事件名字 统一使用 kREKFor+文件名标志+事件标志，例如‘BXLMerchantProducView.m’ 里productCell的点击事件，eventName可以为 kREKForMerchantProducViewClickProduct；
 
 @param params 附带的参数
 */
- (void)routerEvent:(NSString *)eventName params:(id)params;

@end
