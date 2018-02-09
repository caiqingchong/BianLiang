这里对OC的各个变量进行了分析，详细分析见demo。
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



