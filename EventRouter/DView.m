//
//  DView.m
//  EventRouter
//
//  Created by leven on 2018/3/3.
//  Copyright © 2018年 leven. All rights reserved.
//

#import "DView.h"
#import "BView.h"
#import "UIView+RouterEvent.h"

@implementation DView
NSString *const kREKForBViewCallRousi = @"kREKForBViewCallRousi";

- (IBAction)buttonClick:(id)sender {
   UIView *targetView = [self.topVC.view routerEvent:kREKForBViewCallRousi params:@"夹克：哦，肉丝，你在哪？"];
    NSLog(@"targetView = %@",targetView);
}

- (BOOL)observeEvent:(NSString *)eventName params:(id)params {
    if ([eventName isEqualToString:kREKForBViewCallJiake]) {
        NSLog(@"%@",params);
        NSLog(@"夹克:哦，肉丝，我在DView");
        return YES;
    }
    return NO;
}


@end
