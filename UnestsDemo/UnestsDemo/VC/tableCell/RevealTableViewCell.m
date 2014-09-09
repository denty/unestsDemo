//
//  RevealTableViewCell.m
//  UnestsDemo
//
//  Created by broy denty on 14-9-9.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "RevealTableViewCell.h"

@implementation RevealTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [[[NSBundle mainBundle] loadNibNamed:reuseIdentifier owner:self options:nil] lastObject];
    return self;
}

- (void)awakeFromNib
{
    [self setClipsToBounds:YES];
    [self.revealImage setContentMode:UIViewContentModeScaleAspectFill];
    [self.grassLayer setAlpha:0.5];
    [self.grassLayer setBackgroundColor:[UIColor blackColor]];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadDataWithTitle:(NSString *)title SubTitle:(NSString *) subTitle RevealImg:(UIImage *) img
{
    [self.titleLabel setText:@"Heppy Type Where Funny Heppen "];
    [self.subTitleLabel setText:@"good"];
    [self.revealImage setImage:img];
}
@end
