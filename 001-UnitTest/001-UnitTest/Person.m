//
//  Person.m
//  001-单元测试
//
//  Created by hzg on 2018/8/2.
//  Copyright © 2018年 tz. All rights reserved.
//

#import "Person.h"

@implementation Person

/// 字典转模型
- (instancetype) initWithDict:(NSDictionary*) dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        // 预防处理age超限
        if (self.age <= 0 || self.age >= 130) {
            self.age = 0;
        }
    }
    return self;
}

// 预防处理没有找到的key
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

// 异步下载数据
- (void) load:(void(^)(Person* person)) completion {
    
    // 异步子线程执行耗时操作
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        /// 模拟耗时操作
        [NSThread sleepForTimeInterval:2.0];
        
        /// 字典转模型
        Person* person = [[Person alloc] initWithDict:@{@"name":@"Tom", @"nick":@"Cat", @"age":@18}];
        
        /// 回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            if (nil != completion) {
                completion(person);
            }
        });
    });
}

@end
