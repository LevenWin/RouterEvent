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

- (void)routerEvent:(NSString *)eventName params:(id)params {
    NSMutableArray *subViews = self.subviews.mutableCopy;
    while (subViews.count > 0) {
        UIView *view = subViews.firstObject;
        if (!view.hidden && view.alpha >= 0.01) {
            [view routerEvent:eventName params:params];
            [view observeEvent:eventName params:params];
        }
        [subViews removeObject:view];
    }
}
@end
