//
//  AView.m
//  EventRouter
//
//  Created by leven on 2018/3/3.
//  Copyright © 2018年 leven. All rights reserved.
//

#import "AView.h"
#import "BView.h"
@implementation AView{
    BView *_bView;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _bView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([BView class]) owner:self options:nil].firstObject;
        [self addSubview:_bView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _bView.frame = CGRectMake(0, 0, 100, 100);
    _bView.center =  CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [_bView setNeedsLayout];
}

@end
