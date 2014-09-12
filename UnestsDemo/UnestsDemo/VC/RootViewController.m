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
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [headerView setAlpha:0];
    [m_tabelView setTableHeaderView:headerView];
    [rootNavView setAlpha:0.8];
    [self.navigationController.navigationBar setHidden:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdenty = @"RevealTableViewCell";
    RevealTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdenty];
    if (cell == nil) {
        cell = [[RevealTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenty];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    switch (indexPath.row) {
        case 0:
           [cell loadDataWithTitle:@"Heppy Type Where Funny Heppen " SubTitle:@"good" RevealImg:[UIImage imageNamed:@"Bg2.jpg"]];
            break;
        case 1:
            [cell loadDataWithTitle:@"Heppy Type Where Funny Heppen " SubTitle:@"good" RevealImg:[UIImage imageNamed:@"Bg3.jpg"]];
            break;
        case 2:
            [cell loadDataWithTitle:@"Heppy Type Where Funny Heppen " SubTitle:@"good" RevealImg:[UIImage imageNamed:@"Bg4.jpg"]];
            break;
        case 3:
            [cell loadDataWithTitle:@"Heppy Type Where Funny Heppen " SubTitle:@"good" RevealImg:[UIImage imageNamed:@"Bg5.jpg"]];
            break;
        case 4:
            [cell loadDataWithTitle:@"Heppy Type Where Funny Heppen " SubTitle:@"good" RevealImg:[UIImage imageNamed:@"Bg6.jpg"]];
            break;
            
        default:
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RevealDetailViewController * aRevealDetailViewController = [[RevealDetailViewController alloc] init];
    [self.navigationController pushViewController:aRevealDetailViewController animated:YES];
}
@end
