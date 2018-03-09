//
//  DSView.m
//  EventRouter
//
//  Created by leven on 2018/3/9.
//  Copyright © 2018年 leven. All rights reserved.
//

#import "DSView.h"
#import "UIView+RouterEvent.h"

@implementation DSView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [UIColor redColor];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (BOOL)observeEvent:(NSString *)eventName params:(id)params {
    NSLog(@"%@",NSStringFromClass([self class]));
    return NO;
}
@end
