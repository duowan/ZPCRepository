//
//  ZPCDetailViewController.m
//  ZPCExpandCell
//
//  Created by 张培创 on 14-7-16.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import "ZPCDetailViewController.h"

@interface ZPCDetailViewController ()

- (IBAction)backAction:(id)sender;
@end

@implementation ZPCDetailViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)backAction:(id)sender {
    [self expandCellDismissWithanimation:^{
        self.backButton.alpha = 0.0;
    } completion:nil];
}
@end
