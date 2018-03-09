//
//  UIView+RouterEvent.m
//  iOSClient
//
//  Created by leven on 2018/2/28.
//  Copyright © 2018年 borderxlab. All rights reserved.
//

#import "UIView+RouterEvent.h"
#import "UIResponder+RouterEvent.h"
@implementation UIView (RouterEvent)
- (UIViewController *)topVC {
    UIView *currentResponsder = self;
    while (currentResponsder.nextResponder) {
        if ([currentResponsder.nextResponder isKindOfClass:[UIViewController class]]) {
            break;
        }
        currentResponsder = (id)currentResponsder.nextResponder;
    }
    return (id)currentResponsder.nextResponder;
}

- (UIView *)routerEvent:(NSString *)eventName params:(id)params {
    NSMutableArray *subViews = self.subviews.mutableCopy;
    UIView *targetView = nil;
    while (subViews.count > 0
           && !targetView) {
        UIView *view = subViews.firstObject;
        if (!view.hidden && view.alpha >= 0.01) {
            if ([view observeEvent:eventName params:params]) {
                targetView = view;
            }else{
                targetView = [view routerEvent:eventName params:params];
            }
        }
        [subViews removeObject:view];
    }
    return targetView;
}
@end
