//
//  externData.h
//  OCVariableDemo
//
//  Created by 张张凯 on 2018/2/9.
//  Copyright © 2018年 TRS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface externData : NSObject
//声明一个外部全局变量，这里声明的变量不能改变值，老铁们要注意
extern NSString * const myName;

//只是用来获取全局变量的值，并不能用于定义变量。这里的值就可以改变了，下面两种写法都木问题
extern NSString *myAge;

//extern NSString volatile *myAge;  volatile可变变量



@end
