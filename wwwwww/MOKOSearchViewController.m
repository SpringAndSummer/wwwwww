//
//  MOKOSearchViewController.m
//  wwwwww
//
//  Created by moko on 16/1/6.
//  Copyright © 2016年 moko. All rights reserved.
//

#import "MOKOSearchViewController.h"

@interface MOKOSearchViewController ()

@end

@implementation MOKOSearchViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];

    self.navigationController.navigationBar.translucent = YES;

//    [[UIApplication sharedApplication] setStatusBarHidden:YES animated:YES];
//      [self preferredStatusBarStyle];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    

    UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor purpleColor];
    
    [button setTitle:@"ceshi" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"home_discover2x"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];


    [[UIApplication sharedApplication] setStatusBarHidden:YES animated:YES];
      [self preferredStatusBarStyle];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return  UIStatusBarStyleLightContent;
}

-(void)buttonAction
{
    NSLog(@"点击事件");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
