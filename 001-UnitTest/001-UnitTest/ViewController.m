//
//  ViewController.m
//  001-单元测试
//
//  Created by hzg on 2018/8/2.
//  Copyright © 2018年 tz. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary* dict = @{@"name":@"Tom", @"nick":@"Cat", @"age":@18};
    Person* p = [[Person alloc] initWithDict:dict];
    NSLog(@"name = %@, nick = %@, age = %d", p.name, p.nick, p.age);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
