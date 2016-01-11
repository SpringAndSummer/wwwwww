//
//  ViewController.m
//  wwwwww
//
//  Created by moko on 15/11/19.
//  Copyright © 2015年 moko. All rights reserved.
//

#import "ViewController.h"
#import "MOKOViewController.h"
#define ANIMATION_FURATION 2.0

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

-(void)presentAction
{
    
    MOKOViewController *vc = [[MOKOViewController alloc] init];
    vc.type = MOKOViewControllerShow;
     [self presentViewController:vc animated:YES completion:nil];
    
//    if (vc.type == MOKOViewControllerShow) {
//        vc.view.backgroundColor = [UIColor greenColor];
//    }else{
//        vc.view.backgroundColor = [UIColor cyanColor];
//    }

}
-(void)presentAction1{
    MOKOViewController *vc = [[MOKOViewController alloc] init];
    vc.type = MOKOViewControllerHidden;
    [self presentViewController:vc animated:YES completion:nil];
    
//    if (vc.type == MOKOViewControllerShow) {
//        vc.view.backgroundColor = [UIColor greenColor];
//    }else{
//        vc.view.backgroundColor = [UIColor cyanColor];
//    }
//
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
