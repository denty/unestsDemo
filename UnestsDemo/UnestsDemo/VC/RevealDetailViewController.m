//
//  RevealDetailViewController.m
//  UnestsDemo
//
//  Created by broy denty on 14-9-9.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "RevealDetailViewController.h"
#import "RotatedTableView.h"
#import "RotatedTableViewCell.h"
#define expandedHeight  350
#define leftTableView 1
#define middleTableView 2
#define rightTabelView 3
@interface RevealDetailViewController ()
{
    __weak IBOutlet UIView *sliderView;
    RotatedTableView * m_RotatedTableView;
    __weak IBOutlet UIView *leftContentView;
    __weak IBOutlet UIView *middleContentView;
    __weak IBOutlet UIView *rightContentView;
    __weak IBOutlet UIButton *leftButton;
    __weak IBOutlet UIButton *middleButton;
    __weak IBOutlet UIButton *rightButton;
    BOOL expanded;
    UIPanGestureRecognizer * m_recognizer;
    NSInteger subLoadID;
    UITableView *subTabelView;
    NSArray *subTableViewDataArray;
    UIButton * backButton;
    
    UIView *headerCoverView;
}
@end

@implementation RevealDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        expanded = NO;
        subLoadID = 0;
        NSArray * leftArray =[[NSArray alloc] initWithObjects:@"1.8*2.8 舒适大床",@"超舒适空调，全天送风", @"时尚衣柜，便捷储物",@"安全门锁，出入安全",@"大空间，实木地板",nil];
        NSArray * middleArray =[[NSArray alloc] initWithObjects:@"150/天",@"900/周", @"3000/月",@"30000/年",@"入住时间更长，优惠多多",nil];
        NSArray * rightArray =[[NSArray alloc] initWithObjects:@"特别舒服，值得入住",@"天天有活动，好开心！", @"隔音草鸡棒，棒棒棒棒！",@"一个字“特别好”",@"各种大",nil];
        subTableViewDataArray = [[NSArray alloc] initWithObjects:leftArray,middleArray,rightArray,nil];
    }
    return self;
}

#pragma mark - liftfunction
- (void)viewDidLoad
{
    [super viewDidLoad];
    CGFloat tableViewHeight = ([UIScreen mainScreen].bounds.size.height-(leftContentView.frame.size.height-1));
    m_RotatedTableView = [[RotatedTableView alloc] initWithFrame:CGRectMake(0, 0, 320 , tableViewHeight)];
    [m_RotatedTableView setAutoresizingMask:UIViewAutoresizingNone];
    [sliderView addSubview:m_RotatedTableView];
    [m_RotatedTableView setDataSource:self];
    [m_RotatedTableView setDelegate:self];
    [m_RotatedTableView setPagingEnabled:YES];
    [m_RotatedTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [middleButton addTarget:self action:@selector(middleButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [leftButton addTarget:self action:@selector(leftsButtonAction) forControlEvents:UIControlEventTouchUpInside];

    [rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    backButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 30, 36, 36)];
    [backButton setTitle:@"X" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton.layer setCornerRadius:18];
    [backButton setBackgroundColor:leftContentView.backgroundColor];
    [self loadSubTabelView];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [m_RotatedTableView reloadData];
    
    headerCoverView = [[UIView alloc] initWithFrame:CGRectMake(0, -71, 320, 71)];
    [headerCoverView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.3]];
    [self.view addSubview:headerCoverView];
    
    [self.view addSubview:backButton];
    [self.view bringSubviewToFront:backButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableViewDelegate&delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isKindOfClass:[RotatedTableView class]]) {
        static NSString * cellIdenty = @"cell";
        RotatedTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdenty];
        if (cell == nil) {
            cell = [[RotatedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenty];
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:tableView.frame];
            [imageView setContentMode:UIViewContentModeScaleAspectFill];
            [imageView setTag:2];
            [cell addSubview:imageView];
            [cell setClipsToBounds:YES];
            UIView * glassCover = [[UIView alloc] initWithFrame:tableView.frame];
            CAGradientLayer *glassLayer = [[CAGradientLayer alloc] init];
            [glassLayer setFrame:CGRectMake(0, 0, glassCover.frame.size.width, glassCover.frame.size.height)];
            [glassLayer setColors:[NSArray arrayWithObjects:(id)[UIColor colorWithWhite:0 alpha:0].CGColor,(id)[UIColor colorWithWhite:0 alpha:0.7].CGColor ,nil]];
            [glassCover.layer addSublayer:glassLayer];
            [cell addSubview:glassCover];
            UIView * titleView = [[UIView alloc] initWithFrame:CGRectMake(0, glassCover.frame.size.height-70, glassCover.frame.size.width, 70)];
            UILabel *titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 300, 70)];
            [titlelabel setTextColor:[UIColor whiteColor]];
            [titleView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.3]];
            [titleView addSubview:titlelabel];
            [titlelabel setTag:3];
            [cell addSubview:titleView];
        }
        switch (indexPath.row) {
            case 0:
                [(UIImageView *)[cell viewWithTag:2] setImage:[UIImage imageNamed:@"Bg2.jpg"]];
                [(UILabel *)[cell viewWithTag:3] setText:@"大卧室、大享受、大不同"];
                break;
            case 1:
                [(UIImageView *)[cell viewWithTag:2] setImage:[UIImage imageNamed:@"Bg3.jpg"]];
                [(UILabel *)[cell viewWithTag:3] setText:@"文艺青年，必须拥有"];
                break;
            case 2:
                [(UIImageView *)[cell viewWithTag:2] setImage:[UIImage imageNamed:@"Bg4.jpg"]];
                [(UILabel *)[cell viewWithTag:3] setText:@"我的森林风"];
                break;
            case 3:
                [(UIImageView *)[cell viewWithTag:2] setImage:[UIImage imageNamed:@"Bg5.jpg"]];
                [(UILabel *)[cell viewWithTag:3] setText:@"大家都来呵呵呵"];
                break;
            case 4:
                [(UIImageView *)[cell viewWithTag:2] setImage:[UIImage imageNamed:@"Bg6.jpg"]];
                [(UILabel *)[cell viewWithTag:3] setText:@"我的地盘"];
                break;
                
            default:
                break;
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
    else
    {
        switch (subLoadID)
        {
            case leftTableView:
                return [self loadLeftSubTableView:tableView WithIndexPath:indexPath];
                break;
            case middleTableView:
                return [self loadMiddleSubTableView:tableView WithIndexPath:indexPath];
                break;
            case rightTabelView:
                return [self loadRightSubTableView:tableView WithIndexPath:indexPath];
                break;
                
            default:
                break;
        }
        return [self loadLeftSubTableView:tableView WithIndexPath:indexPath];;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isKindOfClass:[RotatedTableView class]])
    {
        return 320;
    }
    else
    {
        return 44;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isKindOfClass:[RotatedTableView class]])
    {
        if (expanded) {
            [UIView animateWithDuration:0.5 animations:^{
                [sliderView setFrame:CGRectMake(sliderView.frame.origin.x, (sliderView.frame.origin.y+expandedHeight), sliderView.frame.size.width, sliderView.frame.size.height)];
            }];
            [UIView animateWithDuration:0.5 animations:^{
                [subTabelView setFrame:CGRectMake(subTabelView.frame.origin.x, (subTabelView.frame.origin.y+expandedHeight), subTabelView.frame.size.width, subTabelView.frame.size.height)];
            }];
            [UIView animateWithDuration:0.5 animations:^{
                [headerCoverView setFrame:CGRectMake(0, -71, 320, 71)];
            }];
            expanded = NO;
        }
    }
    else
    {

    }
}

#pragma mark - buttonAction
- (void)leftsButtonAction
{
    if (!expanded) {
        [UIView animateWithDuration:0.5 animations:^{
            [sliderView setFrame:CGRectMake(sliderView.frame.origin.x, (sliderView.frame.origin.y-expandedHeight), sliderView.frame.size.width, sliderView.frame.size.height)];
        }];
        [UIView animateWithDuration:0.5 animations:^{
            [subTabelView setFrame:CGRectMake(subTabelView.frame.origin.x, (subTabelView.frame.origin.y-expandedHeight), subTabelView.frame.size.width, subTabelView.frame.size.height)];
        }];
        [UIView animateWithDuration:0.5 animations:^{
            [headerCoverView setFrame:CGRectMake(0, 0, 320, 71)];
        }];
        expanded = YES;
        subLoadID = leftTableView;
        [subTabelView reloadData];
    }
    subLoadID = leftTableView;
    [subTabelView reloadData];
}

- (void)middleButtonAction
{
    if (!expanded) {
        [UIView animateWithDuration:0.5 animations:^{
            [sliderView setFrame:CGRectMake(sliderView.frame.origin.x, (sliderView.frame.origin.y-expandedHeight), sliderView.frame.size.width, sliderView.frame.size.height)];
        }];
        [UIView animateWithDuration:0.5 animations:^{
            [subTabelView setFrame:CGRectMake(subTabelView.frame.origin.x, (subTabelView.frame.origin.y-expandedHeight), subTabelView.frame.size.width, subTabelView.frame.size.height)];
        }];
        [UIView animateWithDuration:0.5 animations:^{
            [headerCoverView setFrame:CGRectMake(0, 0, 320, 71)];
        }];
        expanded = YES;
        subLoadID = middleTableView;
        [subTabelView reloadData];
    }
    subLoadID = middleTableView;
    [subTabelView reloadData];
}

- (void)rightButtonAction
{
    if (!expanded) {
        [UIView animateWithDuration:0.5 animations:^{
            [sliderView setFrame:CGRectMake(sliderView.frame.origin.x, (sliderView.frame.origin.y-expandedHeight), sliderView.frame.size.width, sliderView.frame.size.height)];
        }];
        [UIView animateWithDuration:0.5 animations:^{
            [subTabelView setFrame:CGRectMake(subTabelView.frame.origin.x, (subTabelView.frame.origin.y-expandedHeight), subTabelView.frame.size.width, subTabelView.frame.size.height)];
        }];
        [UIView animateWithDuration:0.5 animations:^{
            [headerCoverView setFrame:CGRectMake(0, 0, 320, 71)];
        }];
        expanded = YES;
        subLoadID = rightTabelView;
        [subTabelView reloadData];
    }
    subLoadID = rightTabelView;
    [subTabelView reloadData];
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - setExpandedDataView

- (void)loadSubTabelView
{
    subTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, sliderView.frame.origin.y+sliderView.frame.size.height, 320, expandedHeight) style:UITableViewStylePlain];
    [subTabelView setDelegate:self];
    [subTabelView setDataSource:self];
    [self.view addSubview:subTabelView];
}

- (UITableViewCell *)loadLeftSubTableView:(UITableView *)tableView WithIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIndenty =@"leftTableCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndenty];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndenty];
        UILabel * explainLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 300, 44)];
        [explainLabel setFont:[UIFont systemFontOfSize:13]];
        [explainLabel setTextColor:[UIColor blackColor]];
        [explainLabel setTag:1];
        [cell addSubview:explainLabel];
    }
    UILabel *textLabel =(UILabel *)[cell viewWithTag:1];
    [textLabel setText:[[subTableViewDataArray objectAtIndex:0] objectAtIndex:indexPath.row]];
    return cell;
}

- (UITableViewCell *)loadMiddleSubTableView:(UITableView *)tableView WithIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIndenty =@"middleTableCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndenty];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndenty];
        UILabel * explainLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 300, 44)];
        [explainLabel setFont:[UIFont systemFontOfSize:13]];
        [explainLabel setTextColor:[UIColor blackColor]];
        [explainLabel setTag:1];
        [cell addSubview:explainLabel];
    }
    UILabel *textLabel =(UILabel *)[cell viewWithTag:1];
    [textLabel setText:[[subTableViewDataArray objectAtIndex:1] objectAtIndex:indexPath.row]];
    return cell;
}

- (UITableViewCell *)loadRightSubTableView:(UITableView *)tableView WithIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIndenty =@"rightTableCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndenty];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndenty];
        UILabel * explainLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 300, 44)];
        [explainLabel setFont:[UIFont systemFontOfSize:13]];
        [explainLabel setTextColor:[UIColor blackColor]];
        [explainLabel setTag:1];
        [cell addSubview:explainLabel];
    }
    UILabel *textLabel =(UILabel *)[cell viewWithTag:1];
    [textLabel setText:[[subTableViewDataArray objectAtIndex:2] objectAtIndex:indexPath.row]];
    return cell;
}
@end
