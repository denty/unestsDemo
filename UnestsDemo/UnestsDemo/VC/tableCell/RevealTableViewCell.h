//
//  RevealTableViewCell.h
//  UnestsDemo
//
//  Created by broy denty on 14-9-9.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RevealTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *revealImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *functionIconButton;
@property (weak, nonatomic) IBOutlet UIImageView *functionButtonImage;
@property (weak, nonatomic) IBOutlet UIView *grassLayer;

- (void)loadDataWithTitle:(NSString *)title SubTitle:(NSString *) subTitle RevealImg:(UIImage *) img;
@end
