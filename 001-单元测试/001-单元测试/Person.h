//
//  Person.h
//  001-单元测试
//
//  Created by hzg on 2018/8/2.
//  Copyright © 2018年 tz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* nick;
@property (nonatomic, assign) int age;

- (instancetype) initWithDict:(NSDictionary*) dict;

- (void) load:(void(^)(Person* person)) completion;

@end
