//
//  NextViewController.m
//  OCVariableDemo
//
//  Created by 张张凯 on 2018/2/9.
//  Copyright © 2018年 TRS. All rights reserved.
//

#import "NextViewController.h"
#import "SecondViewController.h"

#import "externData.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor  = [UIColor orangeColor];
    

    myAge = @"100";
    //此处的名字确定的命名是在第三个界面，由于它是全局变量，整个项目通用这个值。直至整个项目被terminal
    NSLog(@"第二个界面我的年龄:%@----nameLL:%@",myAge,myName);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self presentViewController:[SecondViewController new] animated:YES completion:nil];
    
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
