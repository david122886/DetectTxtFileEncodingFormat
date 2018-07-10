//
//  DetectTxtFileEncodingFormat.m
//  DetectTxtFileEncodingFormat
//
//  Created by xxsy-ima001 on 14/12/1.
//  Copyright (c) 2014年 ___xiaoxiangwenxue___. All rights reserved.
//

#import "DetectTxtFileEncodingFormat.h"
#include "uchardet.h"
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <getopt.h>
#include <iostream>

#ifndef VERSION
#define VERSION "Unknown"
#endif
#define BUFFER_SIZE 2048

char buffer[BUFFER_SIZE];
@implementation DetectTxtFileEncodingFormat
///获取文本文档编码格式
+(CFStringEncoding)getTxtFileEncodingFormatWithFilePath:(NSString*)filePath{
    if (!filePath || [filePath isEqualToString:@""]) {
        return kCFStringEncodingUTF8;
    }
    FILE* file;
    char buf[BUFFER_SIZE];
    size_t len;
    uchardet_t ud;
    const char *encode;
    
    file = fopen([filePath UTF8String], "r");
    if (file == NULL) {
        return kCFStringEncodingUTF8;
    }
    len = fread(buf, sizeof(char), BUFFER_SIZE, file);
    fclose(file);
    
    ud = uchardet_new();
    if (uchardet_handle_data(ud, buf, len) != 0) {
        uchardet_delete(ud);
        return kCFStringEncodingUTF8;
    }
    uchardet_data_end(ud);
    encode=uchardet_get_charset(ud);
    uchardet_delete(ud);
    return [self getStringEncodingFromUChar:encode];
}

+(CFStringEncoding)getStringEncodingFromUChar:(const char *)encode{
    
    NSString *encodeStr=[[NSString alloc] initWithCString:encode encoding:NSUTF8StringEncoding];
    
    if ([encodeStr isEqualToString:@"gb18030"]) {
        
        return  kCFStringEncodingGB_18030_2000;
        
    }else if([encodeStr isEqualToString:@"Big5"]){
        
        return kCFStringEncodingBig5;
        
    }else if([encodeStr isEqualToString:@"UTF-8"]){
        
        return kCFStringEncodingUTF8;
        
    }else if([encodeStr isEqualToString:@"Shift_JIS"]){
        
        return kCFStringEncodingShiftJIS;
        
    }else if([encodeStr isEqualToString:@"windows-1252"]){
        
        return  kCFStringEncodingWindowsLatin1;
        
    }else if([encodeStr isEqualToString:@"x-euc-tw"]){
        
        return kCFStringEncodingEUC_TW;
        
    }else if([encodeStr isEqualToString:@"EUC-KR"]){
        
        return kCFStringEncodingEUC_KR;
        
    }else if([encodeStr isEqualToString:@"EUC-JP"]){
        
        return kCFStringEncodingEUC_JP;
        
    }
    return kCFStringEncodingUTF8;
}
@end
