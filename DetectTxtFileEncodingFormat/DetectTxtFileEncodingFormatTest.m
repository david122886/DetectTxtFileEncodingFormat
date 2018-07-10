//
//  DetectTxtFileEncodingFormatTest.m
//  DetectTxtFileEncodingFormat
//
//  Created by xxsy-ima001 on 14/12/1.
//  Copyright (c) 2014年 ___xiaoxiangwenxue___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DetectTxtFileEncodingFormat.h"
@interface DetectTxtFileEncodingFormatTest : XCTestCase

@end

@implementation DetectTxtFileEncodingFormatTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    NSString *path=[[NSBundle mainBundle] pathForResource:@"10恐怖大师斯蒂芬" ofType:@"txt"];
    CFStringEncoding coding = [DetectTxtFileEncodingFormat getTxtFileEncodingFormatWithFilePath:path];
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:path];
    NSData *data =[fileHandle readDataOfLength:2];
    
    NSString *test = [[NSString alloc] initWithData:data encoding:CFStringConvertEncodingToNSStringEncoding(coding)];
    NSLog(@"%@",test);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        NSString *path=[[NSBundle mainBundle] pathForResource:@"超能高手在都市" ofType:@"txt"];
        CFStringEncoding coding = [DetectTxtFileEncodingFormat getTxtFileEncodingFormatWithFilePath:path];
        // Put the code you want to measure the time of here.
    }];
}

@end
