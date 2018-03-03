//
//  BView.m
//  EventRouter
//
//  Created by leven on 2018/3/3.
//  Copyright © 2018年 leven. All rights reserved.
//

#import "BView.h"
#import "UIView+RouterEvent.h"
#import "DView.h"

NSString *const kREKForBViewCallJiake = @"kREKForBViewCallJiake";
@implementation BView
- (IBAction)buttonClick:(id)sender {
    [self.topVC.view routerEvent:kREKForBViewCallJiake params:@"肉丝：哦，夹克，你在哪？"];
}

- (void)observeEvent:(NSString *)eventName params:(id)params {
    if ([eventName isEqualToString:kREKForBViewCallRousi]) {
        NSLog(@"%@",params);
        NSLog(@"肉丝:哦，夹克，我在BView");
    }
}



@end
