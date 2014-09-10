//
//  ZPCViewController.h
//  ZPCExpandCell
//
//  Created by 张培创 on 14-7-16.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  封装了通过cell进入详情页动画类
 */

@interface ZPCViewController : UIViewController

@property (nonatomic) CGRect cellFrame;     //用于保存进入详情页时的cell的frame

/**
 *  列表进入详情调用方法，默认方法
 */
- (void)expandCellToController:(UIViewController *)controller withTableView:(UITableView *)tableView withIndexPath:(NSIndexPath *)indexPath;
/**
 *  详情页退出调用方法，默认方法
 */
- (void)expandCellDismiss;

/**
 *  列表进入详情调用方法，可通过block方法调节动画细节
 */
- (void)expandCellToController:(UIViewController *)controller withTableView:(UITableView *)tableView withIndexPath:(NSIndexPath *)indexPath animation:(void (^)(void))animation completion:(void (^)(void))completion;

/**
 *  详情页退出调用方法，可通过block方法调节动画细节
 */
- (void)expandCellDismissWithanimation:(void (^)(void))animation completion:(void (^)(void))completion;

@end
