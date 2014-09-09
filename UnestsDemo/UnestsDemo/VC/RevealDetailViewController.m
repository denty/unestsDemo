//
//  RevealDetailViewController.m
//  UnestsDemo
//
//  Created by broy denty on 14-9-9.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "RevealDetailViewController.h"
#import "RotatedTableView.h"
@interface RevealDetailViewController ()
{
    RotatedTableView * m_RotatedTableView;
}
@end

@implementation RevealDetailViewController

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
    m_RotatedTableView = [[RotatedTableView alloc] initWithFrame:CGRectMake(0, 0, 320, 400) style:UITableViewStylePlain];
    [self.view addSubview:m_RotatedTableView];
    [m_RotatedTableView setDataSource:self];
    [m_RotatedTableView setDelegate:self];
    [m_RotatedTableView setPagingEnabled:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdenty = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdenty];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenty];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.backgroundColor = [UIColor orangeColor];
            [cell.textLabel setText:@"0"];
            break;
        case 1:
            cell.backgroundColor = [UIColor redColor];
            [cell.textLabel setText:@"1"];
            break;
        case 2:
            cell.backgroundColor = [UIColor yellowColor];
            [cell.textLabel setText:@"2"];
            break;
        case 3:
            cell.backgroundColor = [UIColor blueColor];
            [cell.textLabel setText:@"3"];
            break;
            
        default:
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 320;
}
@end
