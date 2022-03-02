//
//  UIButton+SKAddition.h
//  SKSugarOCExample
//
//  Created by Sky-work on 2022/3/2.
//  Copyright © 2022 YouLong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (SKAddition)

#pragma mark  --------  只设置 title  --------


+ (instancetype)sk_title:(NSString *)title;

+ (instancetype)sk_title:(NSString *)title
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action;


+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize;

+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action;


+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold;

+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action;


+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold
                   color:(UIColor *)color;

+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold
                colorHex:(uint32_t)colorHex;

+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold
             colorHexStr:(NSString *)colorHexStr;


+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold
                   color:(UIColor *)color
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action;

+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold
                colorHex:(uint32_t)colorHex
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action;

+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold
             colorHexStr:(NSString *)colorHexStr
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action;


#pragma mark  --------  只设置 image  -------- 

+ (instancetype)sk_image:(nullable UIImage *)image;

+ (instancetype)sk_image:(nullable UIImage *)image
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action;


+ (instancetype)sk_image:(nullable UIImage *)image 
           imageSelected:(nullable UIImage *)imageSelected;

+ (instancetype)sk_image:(nullable UIImage *)image 
           imageSelected:(nullable UIImage *)imageSelected
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action;



+ (instancetype)sk_imageName:(NSString *)imageName;

+ (instancetype)sk_imageName:(NSString *)imageName
                      target:(_Nullable id)target
                      action:(_Nullable SEL)action;

+ (instancetype)sk_imageName:(NSString *)imageName
           imageNameSelected:(NSString *)imageNameSelected;

+ (instancetype)sk_imageName:(NSString *)imageName
           imageNameSelected:(NSString *)imageNameSelected
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action;


#pragma mark  --------  同时设置 title 与 image  -------- 







@end

NS_ASSUME_NONNULL_END
