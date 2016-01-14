//
//  MOKOViewController.m
//  wwwwww
//
//  Created by moko on 15/11/30.
//  Copyright © 2015年 moko. All rights reserved.
//

#import "MOKOViewController.h"
#import "UINavigationBar+Awesome.h"
#import "MOKOSearchViewController.h"
#import "HTTPRequestManager.h"

#define rect(x,y,w,h) CGRectMake(x, y, w, h)
#define KscreenWidth [UIScreen mainScreen].bounds.size.width
#define KscreenHeight [UIScreen mainScreen].bounds.size.height

@interface MOKOViewController ()<UISearchBarDelegate>

@end

@implementation MOKOViewController

-(void)viewWillAppear:(BOOL)animated //这个方法在 viewDidLoad 之前执行
{
    [super viewWillAppear:animated];
    [self.navigationController setToolbarHidden:NO animated:YES]; //设置toolBar 是否隐藏
    //隐藏系统导航栏 不隐藏点击事件不响应
    self.navigationController.navigationBar.hidden = YES;
    
    
        self.navigationController.navigationBar.barTintColor = [UIColor clearColor];
        self.navigationController.navigationBar.alpha = 0;
        self.navigationController.navigationBar.translucent = NO;
    
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];//设置颜色
    [self.navigationController.navigationBar lt_setContentAlpha:0];//隐藏导航栏的线
    [self.navigationController.navigationBar lt_setTranslationY:20];//Y轴方向上移动导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsCompact];
    
    [self initData];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
     [self.navigationController setToolbarHidden:YES animated:YES]; //设置toolBar 是否隐藏
     self.navigationController.navigationBar.hidden = NO;
}

-(void)initData
{
    int page = 1;
    int number = 10;
    NSString *path = [NSString stringWithFormat:@"https://dwintf.moko.cc:19022/girltasks/daily?page=%d&perpage=%d",page,number];
    HTTPRequestManager *manager = [HTTPRequestManager shareManager];
//    [manager sendGetRequestWith:path requestSuccsion:^(AFHTTPRequestOperation *operation, id restObject) {
//        
//        NSLog(@"%@",restObject);
//        
//    } requestFail:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@",error);
//    }];

   [manager sendGetRequestWith:path requestSuccsion:^(AFHTTPRequestOperation *operation, id resultObject) {
       
       if (resultObject) {
           NSLog(@"%@",resultObject);
       }
       
   } requestFail:^(AFHTTPRequestOperation *operation, NSError *error) {
       
       NSLog(@"%@",error);
       
   }];
    
    
}




- (void)viewDidLoad {
    
    [super viewDidLoad];
    //自定义的导航栏,添加在self.view上  设置好坐标
    UIView *navView = [[UIView alloc] initWithFrame:rect(0, 0, KscreenWidth, 64)];
    navView.backgroundColor = [UIColor orangeColor];
    navView.userInteractionEnabled = YES;
    [self.view addSubview:navView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = rect(15, 26, 30, 30);
    [backButton setImage:[UIImage imageNamed:@"modify_back@2x"] forState:UIControlStateNormal];
    [backButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 10, 20)];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:backButton];
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = rect(KscreenWidth-15-20, 28, 20, 20);
    [searchButton setImage:[UIImage imageNamed:@"home_discover2x"] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:searchButton];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:rect(backButton.frame.origin.x+backButton.frame.size.width+5, 22, KscreenWidth-30-30-20-15-5, 30)];
    searchBar.placeholder = @"搜索明星";
    searchBar.searchBarStyle = UISearchBarStyleMinimal;
//    [searchBar becomeFirstResponder];
    searchBar.delegate = self;
    [navView addSubview:searchBar];
}

-(void)backAction
{
    NSLog(@"返回按钮");
}

-(void)searchAction
{
    MOKOSearchViewController *viewCtrl = [[MOKOSearchViewController alloc] init];
    [self.navigationController pushViewController:viewCtrl animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
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
