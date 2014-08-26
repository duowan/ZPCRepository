//
//  ZPCViewController.m
//  ZPCExpandCell
//
//  Created by 张培创 on 14-7-16.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import "ZPCViewController.h"

@interface ZPCViewController ()

@end

@implementation ZPCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)expandCellToController:(UIViewController *)controller withTableView:(UITableView *)tableView withIndexPath:(NSIndexPath *)indexPath
{
    [self expandCellToController:controller withTableView:tableView withIndexPath:indexPath animation:nil completion:nil];
}

- (void)expandCellDismiss
{
    [self expandCellDismissWithanimation:nil completion:nil];
}

- (void)expandCellToController:(ZPCViewController *)controller withTableView:(UITableView *)tableView withIndexPath:(NSIndexPath *)indexPath animation:(void (^)(void))animation completion:(void (^)(void))completion
{
    [self addChildViewController:controller];
    controller.view.frame = [tableView rectForRowAtIndexPath:indexPath];
    controller.view.center = CGPointMake(controller.view.center.x, controller.view.center.y - tableView.contentOffset.y); // adjusts for the offset of the cell when you select it
    controller.cellFrame = controller.view.frame;
    [self.view addSubview:controller.view];
    
    [UIView animateWithDuration:.3 animations:^{
        controller.view.frame = tableView.frame;
        if (animation) {
            animation();
        }
    } completion:^(BOOL finished) {
        [controller didMoveToParentViewController:self.parentViewController];
        if (completion) {
            completion();
        }
    }];
}

- (void)expandCellDismissWithanimation:(void (^)(void))animation completion:(void (^)(void))completion
{
    [self willMoveToParentViewController:nil];
    [UIView animateWithDuration:.3 animations:^{
        self.view.frame = self.cellFrame;
        if (animation) {
            animation();
        }
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
        if (completion) {
            completion();
        }
    }];
}

@end
