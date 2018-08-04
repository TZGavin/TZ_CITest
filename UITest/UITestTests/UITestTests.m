//
//  UITestTests.m
//  UITestTests
//
//  Created by hzg on 2018/8/4.
//  Copyright © 2018年 tz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface UITestTests : XCTestCase
@property (nonatomic, strong) ViewController* vc;
@end

@implementation UITestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.vc = [ViewController new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.vc = nil;
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // Given
    int a = 5, b = 6, answer = 11;
    
    // When
    int result = [self.vc sum:a with:b];
    
    // Then
    XCTAssert(result == answer, @"测试失败！！");
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
