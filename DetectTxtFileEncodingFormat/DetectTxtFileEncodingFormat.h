//
//  DetectTxtFileEncodingFormat.h
//  DetectTxtFileEncodingFormat
//
//  Created by xxsy-ima001 on 14/12/1.
//  Copyright (c) 2014年 ___xiaoxiangwenxue___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetectTxtFileEncodingFormat : NSObject
///获取文本文档编码格式
+(CFStringEncoding)getTxtFileEncodingFormatWithFilePath:(NSString*)filePath;
@end
