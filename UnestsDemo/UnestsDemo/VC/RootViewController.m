//
//  RootViewController.m
//  UnestsDemo
//
//  Created by broy denty on 14-9-9.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "RootViewController.h"
#import "RevealDetailViewController.h"
@interface RootViewController ()
{
    __weak IBOutlet UITableView *m_tabelView;
    __weak IBOutlet UIImageView *rightButtonImg;
    __weak IBOutlet UIButton *rightButton;
    __weak IBOutlet UIView *rootNavView;
    __weak IBOutlet UILabel *rootTitleLabel;
}
@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    [headerView setAlpha:0];
    [m_tabelView setTableHeaderView:headerView];
    [rootNavView setAlpha:0.8];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdenty = @"RevealTableViewCell";
    RevealTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdenty];
    if (cell == nil) {
        cell = [[RevealTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenty];
    }
    [cell loadDataWithTitle:@"Heppy Type Where Funny Heppen " SubTitle:@"good" RevealImg:[UIImage imageNamed:@"Bg4.jpg"]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RevealDetailViewController * aRevealDetailViewController = [[RevealDetailViewController alloc] init];
    [self presentViewController:aRevealDetailViewController animated:YES completion:^{
        
    }];
}
@end
