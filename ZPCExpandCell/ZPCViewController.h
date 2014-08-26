//
//  ZPCViewController.h
//  ZPCExpandCell
//
//  Created by 张培创 on 14-7-16.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPCViewController : UIViewController

@property (nonatomic) CGRect cellFrame;

- (void)expandCellToController:(UIViewController *)controller withTableView:(UITableView *)tableView withIndexPath:(NSIndexPath *)indexPath;

- (void)expandCellDismiss;

- (void)expandCellToController:(UIViewController *)controller withTableView:(UITableView *)tableView withIndexPath:(NSIndexPath *)indexPath animation:(void (^)(void))animation completion:(void (^)(void))completion;

- (void)expandCellDismissWithanimation:(void (^)(void))animation completion:(void (^)(void))completion;

@end
