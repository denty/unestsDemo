//
//  RotatedTableView.m
//  UnestsDemo
//
//  Created by broy denty on 14-9-9.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "RotatedTableView.h"

@implementation RotatedTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.transform = CGAffineTransformRotate( CGAffineTransformIdentity, -M_PI/2);
        self.frame = frame;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super awakeFromNib];
    CGRect frame = self.frame;
    self.transform = CGAffineTransformRotate( CGAffineTransformIdentity, -M_PI/2);
    self.frame = frame;
}


@end
