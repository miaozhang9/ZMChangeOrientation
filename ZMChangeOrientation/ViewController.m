//
//  ViewController.m
//  ZMChangeOrientation
//
//  Created by Miaoz on 2018/3/6.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "BaseNavigationController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"竖屏" style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"横屏" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(90, 100, 200, 30)];
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(enterMain) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(90, 200, 200, 30)];
    btn2.backgroundColor = [UIColor lightGrayColor];

    [btn2 setTitle:@"present" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(enterMain2) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn2];
}

- (void)leftAction
{
    
    
        [self interfaceOrientation:UIInterfaceOrientationPortrait];
}

- (void)rightAction
{
        [self interfaceOrientation:UIInterfaceOrientationLandscapeRight];
}
- (void)enterMain
{
    
   
//    MainViewController *mainVC = [[MainViewController alloc] init];
//    BaseNavigationController *baseNaVC = [[BaseNavigationController alloc] initWithRootViewController:mainVC];
//    [self presentViewController:baseNaVC animated:YES completion:nil];
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    [self.navigationController pushViewController:mainVC animated:YES];
    
}

- (void)enterMain2
{
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    BaseNavigationController *baseNaVC = [[BaseNavigationController alloc] initWithRootViewController:mainVC];
    [self presentViewController:baseNaVC animated:YES completion:nil];
    
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
