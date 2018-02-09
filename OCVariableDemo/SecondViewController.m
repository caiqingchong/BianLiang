//
//  SecondViewController.m
//  OCVariableDemo
//
//  Created by 张张凯 on 2018/2/9.
//  Copyright © 2018年 TRS. All rights reserved.
//

#import "SecondViewController.h"
#import "externData.h"

//在这里对全局变量进行设置，也只有仅此一次的社会做
NSString * const myName = @"张三";
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSLog(@"我们在另一个文件中获取的数据为myName:%@",myName);

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
