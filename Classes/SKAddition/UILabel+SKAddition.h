//
//  UILabel+SKAddition.h
//  SKSugarOCExample
//
//  Created by Sky-work on 2022/3/2.
//  Copyright © 2022 YouLong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (SKAddition)


#pragma mark 使用 UIColor

/// sk_根据 text 创建 label 【字号默认14，黑色，不加粗，左对齐】
+ (instancetype)sk_text:(NSString *)text;

/// sk_根据 text/ fontSize 创建 label 【默认黑色，不加粗，左对齐】
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize;

/// sk_根据 text/ fontSize/ color 创建 label 【默认不加粗，左对齐】
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
                  color:(UIColor *)color;

/// sk_根据 text/ fontSize/ color/ alignment 创建 label 【默认不加粗】
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
                  color:(UIColor *)color 
              alignment:(NSTextAlignment)alignment;

/// sk_根据 text/ fontSize/ color/ alignment/ isBold 创建 label 
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
                  color:(UIColor *)color 
              alignment:(NSTextAlignment)alignment 
                 isBold:(BOOL)isBold;

/// sk_根据 text/ fontSize/ color/ alignment/ isBold/ isFreedom/ (^tapAction) 创建 label
/// 
/// @param isBold 字体是否加粗
/// @param isFreedom 是否不自动适应文字: true-自由的，不自动适应；false-自动适应文字大小;
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
                  color:(UIColor *)color 
              alignment:(NSTextAlignment)alignment 
                 isBold:(BOOL)isBold 
              isFreedom:(BOOL)isFreedom; 




#pragma mark 使用 UIColorHex (uint32_t)

/// sk_根据 text/ fontSize/ colorHex 创建 label 【默认不加粗，左对齐】
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
                  colorHex:(uint32_t)colorHex;

/// sk_根据 text/ fontSize/ colorHex/ alignment 创建 label 【默认不加粗】
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
               colorHex:(uint32_t)colorHex
              alignment:(NSTextAlignment)alignment;

/// sk_根据 text/ fontSize/ colorHex/ alignment/ isBold 创建 label 
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
               colorHex:(uint32_t)colorHex 
              alignment:(NSTextAlignment)alignment 
                 isBold:(BOOL)isBold;

/// sk_根据 text/ fontSize/ colorHex/ isBold 创建 label 
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
               colorHex:(uint32_t)colorHex
                 isBold:(BOOL)isBold;



/// sk_根据 text/ fontSize/ colorHex/ alignment/ isBold/ isFreedom/ (^tapAction) 创建 label
/// 
/// @param isBold 字体是否加粗
/// @param isFreedom 是否不自动适应文字: true-自由的，不自动适应；false-自动适应文字大小;
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
               colorHex:(uint32_t)colorHex 
              alignment:(NSTextAlignment)alignment 
                 isBold:(BOOL)isBold 
              isFreedom:(BOOL)isFreedom; 



#pragma mark 使用 UIColorHex (string)

/// sk_根据 text/ fontSize/ colorHexStr 创建 label 【默认不加粗，左对齐】
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
                  colorHexStr:(NSString *)colorHexStr;

/// sk_根据 text/ fontSize/ colorHexStr/ alignment 创建 label 【默认不加粗】
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
            colorHexStr:(NSString *)colorHexStr
              alignment:(NSTextAlignment)alignment;

/// sk_根据 text/ fontSize/ colorHexStr/ alignment/ isBold 创建 label 
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
            colorHexStr:(NSString *)colorHexStr
              alignment:(NSTextAlignment)alignment 
                 isBold:(BOOL)isBold;

/// sk_根据 text/ fontSize/ colorHexStr/ isBold 创建 label 
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
            colorHexStr:(NSString *)colorHexStr
                 isBold:(BOOL)isBold;


/// sk_根据 text/ fontSize/ colorHexStr/ alignment/ isBold/ isFreedom/ (^tapAction) 创建 label
/// 
/// @param isBold 字体是否加粗
/// @param isFreedom 是否不自动适应文字: true-自由的，不自动适应；false-自动适应文字大小;
+ (instancetype)sk_text:(NSString *)text 
               fontSize:(CGFloat)fontSize 
            colorHexStr:(NSString *)colorHexStr
              alignment:(NSTextAlignment)alignment 
                 isBold:(BOOL)isBold 
              isFreedom:(BOOL)isFreedom; 





@end

NS_ASSUME_NONNULL_END
