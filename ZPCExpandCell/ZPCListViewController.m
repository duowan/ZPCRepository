//
//  ZPCListViewController.m
//  ZPCExpandCell
//
//  Created by 张培创 on 14-7-16.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import "ZPCListViewController.h"
#import "ZPCDetailViewController.h"

@interface ZPCListViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation ZPCListViewController

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
    // Do any additional setup after loading the view.
    self.dataArray = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [self.dataArray addObject:[NSString stringWithFormat:@"test%d",i]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testTableViewCell"];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor colorWithHue:.1 + .07*indexPath.row saturation:1 brightness:1 alpha:1];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZPCDetailViewController *detailController = [self.storyboard instantiateViewControllerWithIdentifier:@"ZPCDetailViewController"];
    detailController.view.backgroundColor = [UIColor colorWithHue:.1 + .07*indexPath.row saturation:1 brightness:1 alpha:1];
    detailController.detailCell.textLabel.text = self.dataArray[indexPath.row];
    detailController.backButton.alpha = 0.0;
    [self expandCellToController:detailController withTableView:tableView withIndexPath:indexPath animation:^{
        //可用于调整一些动画细节
        detailController.backButton.alpha = 1.0;
    } completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
