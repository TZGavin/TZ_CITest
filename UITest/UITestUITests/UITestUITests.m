//
//  UITestUITests.m
//  UITestUITests
//
//  Created by hzg on 2018/8/4.
//  Copyright © 2018年 tz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface UITestUITests : XCTestCase
@property (nonatomic, strong) ViewController* vc;
@end

@implementation UITestUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    self.vc = [ViewController new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.vc = nil;
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // Given
    int a = 5, b = 6, answer = 11;
    
    // When
    int result = [self.vc sum:a with:b];
    
    // Then
    XCTAssert(result == answer, @"测试失败！！");
}

@end