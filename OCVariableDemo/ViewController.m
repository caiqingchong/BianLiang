//
//  ViewController.m
//  OCVariableDemo
//
//  Created by 张张凯 on 2018/2/9.
//  Copyright © 2018年 TRS. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "externData.h"

@interface ViewController ()

@end

@implementation ViewController

NSString *const kReachabilityChangedNotification = @"kReachabilityChangedNotification";

NSString *myAge = @"18";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self staticTest];
    extern int age;
    NSLog(@"获取全局变量的age:%d",age);
    
    [self staticConstAndDefine];


    NSLog(@"第一个界面我的年龄:%@",myAge);

}



/*
 1、全局变量
 2、静态变量 static
 3、局部变量
 4、实例变量
 5、const变量值不可变
 6、volatile变量值随时可变

 static 和 extern水火不容。区别:
 　　（1）extern修饰的全局变量默认是有外部链接的，作用域是整个工程，在一个文件内定义的全局变量，在另一个文件中，通过external全局变量的声明，就可以使用全局变量。
 
 　　（2）static修饰的全局静态变量，作用域是声明此变量所在的文件。
 */




/*
 一、静态变量static
 a:修饰局部变量
 让局部变量只初始化一次
 局部变量在程序中只有一份内存
 并不会改变局部变量的作用域，仅仅是改变了局部变量的生命周期（只到程序结束，这个局部变量才会销毁）
 
 b:修饰全局变量
 全局变量的作用域仅限于当前文件
 
 static作用于函数：e.g.: static void func(void);
 　　使用static用于函数定义时，对函数的连接方式产生影响，使得函数只在本文件内部有效，对其他文件是不可见的。这样的函数又叫作静态函数。使用静态函数的好处是，不用担心与其他文件的同名函数产生干扰，另外也是对函数本身的一种保护机制。
 　　如果想要其他文件可以引用本地函数，则要在函数定义时使用关键字extern，表示该函数是外部函数，可供其他文件调用。另外在要引用别的文件中定义的外部函数的文件中，使用extern声明要用的外部函数即可。
 
 
 重点：也就是说，static定义的方法和或者变量最多也不会超出所在文件，也就是所在类。
 */
static int age = 20;//全局变量
static NSString *name = @"zhang";
- (void)staticTest{
    // static修饰局部变量，将全局变量变成局部变量，但是在其他地方全局变量还是不变的
    static int age = 0;
    age++;
    //所以此处输入的是局部变量的值，在其他部分调用全局age还是20.
    NSLog(@"局部变量的age：%d",age);
}




/*
 二、const 使用
 */
- (void)constTest{
    /*
     1、没有const修饰的指针。指针p和*p都能够被修改。
     */
    // 定义一个指针变量
    int *p = NULL;
    
    // 定义2个int类型的变量
    int a = 10;
    int b = 30;
    
    // p指向a
    p = &a;
    *p = 20;
    
    // p指向b
    p = &b;
    *p = 40;
    
    NSLog(@"%d %d", a, b);
    
    /*
     2、const修饰的*m，只能被赋值一次，若再次被赋值，编译器会报错。
     const int *m = NULL;
     *m = 20;
     */
  
    
    /*
      3、const修饰的m,被const修饰的n只能存一次地址，以后再也不能存其它地址了，否则编译器报错
    const修饰的指针变量n
     int * const n = NULL;
     int c = 20;
     n = &c; // 编译器报错，不能修改指针变量n
     */
    
    
    /*
     4、const声明字符串的用法，只能赋值一次，再次赋值会出错。
     */
    NSString *const name = @"sam";
    
    
    
}

//三、static&Const联合使用
- (void)staticAndConst{
    
    /*
     1、static将一个全局变量变成局部变量
     2、const将一个局部变量变成局部常量
     */
    // 定义了一个局部常量,只能被赋值一次，无法再次改变。
    static const CGFloat ZMJRed = 0.4;
    static const CGFloat ZMJGreen = 0.6;
    static const CGFloat ZMJBlue = 0.7;
    
    NSLog(@"---------ZMJRed：%f------ZMJGreen:%f------ZMJBlue:%f",ZMJRed,ZMJGreen,ZMJBlue);
}

//四、static const 与#define 比较
- (void)staticConstAndDefine{
    /*
     1、使用static const修饰变量和宏定义的比较
     相同点：
     a:都不能再被修改
     b:一处修改，其他地方都改不了
     不同点：
     a:static const 修饰变量只有一份内存
     b:宏定义只是简单的替换，每次使用都需要创建一份内存。
     
     2、结论：
     使用static const修饰更加高效，在同一个文件内可以使用static const取代#define
     static const声明一个静态的全局只读常量
     3、使用场景：
     在一个文件中经常使用的字符串常量，可以使用static与const组合，可用于替换#define
     */
    
    /*
     const和宏的区别：
    const简介:之前常用的字符串常量，一般是抽成宏，但是苹果不推荐我们抽成宏，推荐我们使用const常量。
    
    编译时刻:宏是预编译（编译之前处理），const是编译阶段。
    编译检查:宏不做检查，不会报编译错误，只是替换，const会编译检查，会报编译错误。
    宏的好处:宏能定义一些函数，方法。 const不能。
    宏的坏处:使用大量宏，容易造成编译时间久，每次都需要重新替换。
    */
    
    
    //1、static const 修饰变量只有一份内存
    static const CGFloat ZMJBlue = 0.4;
    //2、只是用0.4替换ZMJRed  define每次使用都会创建一份内存，所以效率不如static const
    #define ZMJRed @"zhangsanlisi"
   
    NSString *str = ZMJRed;
    NSString *str1 = ZMJRed;
    NSLog(@"---str:%p-------str1:%p",str,str1);
#warning 但是引用的define的时候并没有创建内存啊，莫名其妙
    
    // 3、开发中经常拿到key修改值，因此用const修饰key,表示key只读，不允许修改。
    static  NSString * const key = @"name";
    
    // 4、如果 const修饰 *key1,表示*key1只读，key1还是能改变。
    
    static  NSString const *key1 = @"name";
    NSLog(@"修改前：%@",key);

    key1 = @"zhangsanfang";
    NSLog(@"相亲们，修改后没毛病：%@",key1);
    
//    2018-02-09 14:36:06.617239+0800 OCVariableDemo[4842:891035] --------static1:0x107083970-------static2:0x107083970
//    2018-02-09 14:36:06.617341+0800 OCVariableDemo[4842:891035] --------define:0x608000052000-------define:0x608000052000

}

/*
 五：extern与const联合使用：
 重点：
 static与const组合：在每个文件都需要定义一份静态全局变量。
 extern与const组合:只需要定义一份全局变量，多个文件共享。
 
 extern作用:
 只是用来获取全局变量(包括全局静态变量)的值，不能用于定义变量
 extern工作原理:
 先在当前文件查找有没有全局变量，没有找到，才会去其他文件查找。
 */
- (void)externAndConst{
    /*
     一般会先新建.h文件专门存放常量的引用，在iOS的网络判断Reachbility中就有。
     注意一定要在.h文件中定义，否则会报错。
     */
//    extern NSString *const kReachabilityChangedNotification;
//    extern const int num;
    
    
    //逼格更高的一种写法，模仿系统UIKIT_EXTERN来替代extern
//    UIKIT_EXTERN NSString *const kReachabilityChangedNotification;
//    UIKIT_EXTERN const int num;
    
    /*
     在.m file中进行赋值专门存放static const修饰的变量，需要用的时候导入头文件就可以了。
     定义整个程序都能访问的常量
     */
   
    const int num = 666;
    NSString *const kReachabilityChangedNotification = @"kReachabilityChangedNotification";
 
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self presentViewController:[NextViewController new] animated:YES completion:nil];
    
}



@end
