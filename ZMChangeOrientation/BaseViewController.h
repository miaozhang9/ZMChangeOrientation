//
//  BaseViewController.h
//  ZMChangeOrientation
//
//  Created by Miaoz on 2018/3/6.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (BOOL)shouldAutorotate;
- (void)interfaceOrientation:(UIInterfaceOrientation)orientation;
@end
