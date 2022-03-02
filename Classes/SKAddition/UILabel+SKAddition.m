//
//  UILabel+SKAddition.m
//  SKSugarOCExample
//
//  Created by Sky-work on 2022/3/2.
//  Copyright © 2022 YouLong. All rights reserved.
//

#import "UILabel+SKAddition.h"


@implementation UIColor (SKHex)

+ (instancetype)hex:(uint32_t)colorHex {
    return [self hex:colorHex alpha:1];
}

+ (instancetype)hex:(uint32_t)colorHex alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:(colorHex & 0xFF0000) >> 16 / 255  
                           green:(colorHex & 0x00FF00) >> 8 / 255
                            blue:colorHex & 0x0000FF / 255 
                           alpha:alpha];
}


+ (instancetype)hexStr:(NSString *)hexStr {
    return [self hexStr:hexStr alpha:1];
}

+ (instancetype)hexStr:(NSString *)hexStr alpha:(CGFloat)alpha {
    NSString *cString = [[hexStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    //hexString应该6到8个字符
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    //如果hexString 有@"0X"前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    
    //如果hexString 有@"#""前缀
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    //RGBCOLOR转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //R
    NSString *rString = [cString substringWithRange:range];
    
    //G
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //B
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

@end



#pragma mark -  UILabel+SKAddition

@implementation UILabel (SKAddition)


#pragma mark 使用 UIColor

/// sk_根据 text 创建 label 【字号默认14，黑色，不加粗，左对齐】
+ (instancetype)sk_text:(NSString *)text
{
    return [self sk_text:text fontSize:14];
}

/// sk_根据 text/ fontSize 创建 label 【默认黑色，不加粗，左对齐】
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize
{
    return [self sk_text:text fontSize:fontSize color:UIColor.blackColor];
}

/// sk_根据 text/ fontSize/ color 创建 label 【默认不加粗，左对齐】
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
                  color:(UIColor *)color
{
    return [self sk_text:text fontSize:fontSize color:color alignment:NSTextAlignmentLeft];
}

/// sk_根据 text/ fontSize/ color/ alignment 创建 label 【默认不加粗】
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
                  color:(UIColor *)color 
              alignment:(NSTextAlignment)alignment
{
    return [self sk_text:text fontSize:fontSize color:color alignment:alignment isBold:NO];
}

/// sk_根据 text/ fontSize/ color/ alignment/ isBold 创建 label 
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
                  color:(UIColor *)color 
              alignment:(NSTextAlignment)alignment 
                 isBold:(BOOL)isBold
{
    return [self sk_text:text fontSize:fontSize color:color alignment:alignment isBold:isBold isFreedom:NO];
}

// 总方法- sk_根据 text/ fontSize/ color/ alignment/ isBold/ isFreedom/ (^tapAction) 创建 label
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
                  color:(UIColor *)color 
              alignment:(NSTextAlignment)alignment 
                 isBold:(BOOL)isBold 
              isFreedom:(BOOL)isFreedom
{
    UILabel *lb = [[UILabel alloc] init];
    lb.text = text;
    lb.textColor = color;
    
    lb.font = isBold ? [UIFont boldSystemFontOfSize:fontSize] : [UIFont systemFontOfSize:fontSize];
    isFreedom ?: [lb sizeToFit];
    
    return lb;
}





#pragma mark 使用 UIColorHex (uint32_t)

/// sk_根据 text/ fontSize/ colorHex 创建 label 【默认不加粗，左对齐】
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
                  colorHex:(uint32_t)colorHex
{
    return [self sk_text:text fontSize:fontSize colorHex:colorHex alignment:NSTextAlignmentLeft];
}

/// sk_根据 text/ fontSize/ colorHex/ alignment 创建 label 【默认不加粗】
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
               colorHex:(uint32_t)colorHex
              alignment:(NSTextAlignment)alignment
{
    return [self sk_text:text fontSize:fontSize colorHex:colorHex alignment:alignment isBold:NO];
}

/// sk_根据 text/ fontSize/ colorHex/ alignment/ isBold 创建 label 
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
               colorHex:(uint32_t)colorHex 
              alignment:(NSTextAlignment)alignment 
                 isBold:(BOOL)isBold
{
    return [self sk_text:text fontSize:fontSize colorHex:colorHex alignment:alignment isBold:isBold isFreedom:NO];
}


// 总方法- sk_根据 text/ fontSize/ colorHex/ alignment/ isBold/ isFreedom/ (^tapAction) 创建 label
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
               colorHex:(uint32_t)colorHex 
              alignment:(NSTextAlignment)alignment 
                 isBold:(BOOL)isBold 
              isFreedom:(BOOL)isFreedom
{
    UIColor *color = [UIColor hex:colorHex];
    return [self sk_text:text fontSize:fontSize color:color alignment:alignment isBold:isBold isFreedom:isFreedom];
}



#pragma mark 使用 UIColorHex (string)

/// sk_根据 text/ fontSize/ colorHexStr 创建 label 【默认不加粗，左对齐】
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
                  colorHexStr:(NSString *)colorHexStr
{
    return [self sk_text:text fontSize:fontSize colorHexStr:colorHexStr alignment:NSTextAlignmentLeft];
}

/// sk_根据 text/ fontSize/ colorHexStr/ alignment 创建 label 【默认不加粗】
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
            colorHexStr:(NSString *)colorHexStr
              alignment:(NSTextAlignment)alignment
{
    return [self sk_text:text fontSize:fontSize colorHexStr:colorHexStr alignment:alignment isBold:NO];
}

/// sk_根据 text/ fontSize/ colorHexStr/ alignment/ isBold 创建 label 
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
            colorHexStr:(NSString *)colorHexStr
              alignment:(NSTextAlignment)alignment 
                 isBold:(BOOL)isBold
{
    return [self sk_text:text fontSize:fontSize colorHexStr:colorHexStr alignment:alignment isBold:isBold isFreedom:NO];
}

/// sk_根据 text/ fontSize/ colorHexStr/ isBold 创建 label 
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
            colorHexStr:(NSString *)colorHexStr
                 isBold:(BOOL)isBold
{
    return [self sk_text:text fontSize:fontSize colorHexStr:colorHexStr alignment:NSTextAlignmentLeft isBold:isBold];
}


/// sk_根据 text/ fontSize/ colorHexStr/ alignment/ isBold/ isFreedom/ (^tapAction) 创建 label
/// 
/// @param isBold 字体是否加粗
/// @param isFreedom 是否不自动适应文字: true-自由的，不自动适应；false-自动适应文字大小;
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
            colorHexStr:(NSString *)colorHexStr
              alignment:(NSTextAlignment)alignment 
                 isBold:(BOOL)isBold 
              isFreedom:(BOOL)isFreedom
{
    UIColor *color = [UIColor hexStr:colorHexStr];
    return [self sk_text:text fontSize:fontSize color:color alignment:alignment isBold:isBold isFreedom:isFreedom];
}




@end
