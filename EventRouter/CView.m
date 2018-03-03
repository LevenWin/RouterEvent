//
//  CView.m
//  EventRouter
//
//  Created by leven on 2018/3/3.
//  Copyright © 2018年 leven. All rights reserved.
//

#import "CView.h"
#import "DView.h"
@implementation CView{
    DView *_dView;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _dView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([DView class]) owner:self options:nil].firstObject;
        [self addSubview:_dView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _dView.frame = CGRectMake(0, 0, 100, 100);
    _dView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [_dView setNeedsLayout];
}


@end
