//
//  RotatedTableViewCell.m
//  UnestsDemo
//
//  Created by broy denty on 14-9-10.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "RotatedTableViewCell.h"

@implementation RotatedTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        CGRect frame = self.frame;
        self.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI/2);
        self.frame = frame;
    }
    return self;
}

- (void)awakeFromNib
{
    CGRect frame = self.frame;
    self.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI/2);
    self.frame = frame;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
