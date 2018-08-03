//
//  PersonTests.m
//  001-单元测试Tests
//
//  Created by hzg on 2018/8/2.
//  Copyright © 2018年 tz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonTests : XCTestCase

@end

@implementation PersonTests

+ (void) setUp {
    NSLog(@"+setUp");
}

- (void)setUp {
    NSLog(@"-setUp");
    [super setUp];
}

- (void)tearDown {
    NSLog(@"-tearDown");
    [super tearDown];
}

// 逻辑测试方法
- (void)testNewPerson {
    
    // 1.测试 name和age 是否一致
    [self checkPersonWithDict:@{@"name":@"zhou", @"age":@30}];
    
    /** 2.测试出 age 不符合实际，那么需要在字典转模型方法中对age加以判断：
     if (obj.age <= 0 || obj.age >= 130) {
        obj.age = 0;
     } */
    [self checkPersonWithDict:@{@"name":@"zhang",@"age":@200}];
    
    // 3.测试出 name 为nil的情况，因此在XCTAssert里添加条件：“person.name == nil“
    [self checkPersonWithDict:@{}];
    
    // 4.测试出 Person类中没有 title 这个key，在字典转模型方法中实现：- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
    [self checkPersonWithDict:@{@"name":@"zhou", @"age":@30, @"title":@"boss"}];
    
    // 5.总体再验证一遍，结果Build Succeeded，测试全部通过
    [self checkPersonWithDict:@{@"name":@"zhou", @"age":@-1, @"title":@"boss"}];
}

// 根据字典检查新建的 person 信息
- (void)checkPersonWithDict:(NSDictionary *)dict {
    Person *person = [[Person alloc] initWithDict:dict];
    NSLog(@"%@",person);
    
    // 获取字典中的信息
    NSString *name = dict[@"name"];
    NSString *nick = dict[@"nick"];
    NSInteger age = [dict[@"age"] integerValue];
    
    // 1.检查名字
    XCTAssert([name isEqualToString:person.name] || person.name == nil, @"姓名不一致");
    
    // 2.检测呢称
    XCTAssert([nick isEqualToString:person.nick] || person.nick == nil, @"呢称不一致");
    
    // 3.检查年龄
    if (person.age > 0 && person.age < 130) {
        XCTAssert(age == person.age, @"年龄不一致");
    } else {
        XCTAssert(person.age == 0, @"年龄超限");
    }
}

/// 异步测试
- (void) testLoad {
    
    /// 设置期望
    XCTestExpectation *expectation = [self expectationWithDescription:@"异步加载 Person"];
   
    [[Person alloc] load:^(Person *person) {
       
        // 断言测试
        // 1.检查名字
        XCTAssert(person.name, @"名字不能为空");
        
        // 2.检查年龄
        XCTAssert(person.age > 0 && person.age < 130, @"年龄不合法");
        
        // 标注预期达成
        [expectation fulfill];
    }];
    
    /// 设置超时时间
    [self waitForExpectationsWithTimeout:3 handler:^(NSError * _Nullable error) {
        NSLog(@"error = %@", [error description]);
    }];
}

/// 性能测试
/*
 相同的代码重复执行 10 次，统计计算时间，平均时间！
 性能测试代码一旦写好，可以随时测试！
 */
- (void) testPersonPerformance {
    [self measureBlock:^{
        NSTimeInterval start = CACurrentMediaTime();
        // 测试用例，循环10000次，为了演示效果
        for (NSInteger i = 0; i < 10000; i++)
        {
            Person* p = [[Person alloc] initWithDict:@{@"name":@"zhang",@"age":@20}];
            
        }
        // 传统测试代码耗时方法
        NSLog(@"传统测试方法 -- %lf",CACurrentMediaTime() - start);
    }];
}


+ (void) tearDown {
    NSLog(@"+tearDown");
}

@end
