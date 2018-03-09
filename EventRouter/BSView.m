//
//  BSView.m
//  EventRouter
//
//  Created by leven on 2018/3/9.
//  Copyright © 2018年 leven. All rights reserved.
//

#import "BSView.h"

@implementation BSView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [UIColor yellowColor];

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (BOOL)observeEvent:(NSString *)eventName params:(id)params {
    NSLog(@"%@",NSStringFromClass([self class]));
    return NO;
}

@end
