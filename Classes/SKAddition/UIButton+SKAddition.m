//
//  UIButton+SKAddition.m
//  SKSugarOCExample
//
//  Created by Sky-work on 2022/3/2.
//  Copyright © 2022 YouLong. All rights reserved.
//

#import "UIButton+SKAddition.h"

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



#pragma mark -  UIButton+SKAddition

@implementation UIButton (SKAddition)


#pragma mark  --------  只设置 title  --------


+ (instancetype)sk_title:(NSString *)title
{
    return [self sk_title:title target:nil action:nil];
}

+ (instancetype)sk_title:(NSString *)title
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action
{
    return [self sk_title:title fontSize:14 target:target action:action];
}


+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
{
    return [self sk_title:title fontSize:fontSize target:nil action:nil];
}

+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action
{
    return [self sk_title:title fontSize:fontSize isFontBold:NO target:target action:action];
}


+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold
{
    return [self sk_title:title fontSize:fontSize isFontBold:isFontBold target:nil action:nil];
}

+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action
{
    return [self sk_title:title fontSize:fontSize isFontBold:isFontBold color:UIColor.blackColor target:target action:action];
}


+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold
                   color:(UIColor *)color
{
    return [self sk_title:title fontSize:fontSize isFontBold:isFontBold color:color target:nil action:nil];
}

+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold
                colorHex:(uint32_t)colorHex
{
    return [self sk_title:title fontSize:fontSize isFontBold:isFontBold color:[UIColor hex:colorHex]];
}

+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold
             colorHexStr:(NSString *)colorHexStr
{
    return [self sk_title:title fontSize:fontSize isFontBold:isFontBold color:[UIColor hexStr:colorHexStr]];
}




+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold
                   color:(UIColor *)color
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action
{
    UIButton *bt = [[UIButton alloc] init];
    [bt setTitle:title forState:UIControlStateNormal];
    [bt setTitleColor:color forState:UIControlStateNormal];
    bt.titleLabel.font = isFontBold ? [UIFont boldSystemFontOfSize:fontSize] : [UIFont systemFontOfSize:fontSize];
    
    if (target != nil && action != nil) {
        [bt addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    return bt;
}

+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold
                colorHex:(uint32_t)colorHex
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action
{
    return [self sk_title:title fontSize:fontSize isFontBold:isFontBold color:[UIColor hex:colorHex] target:target action:action];
}

+ (instancetype)sk_title:(NSString *)title
                fontSize:(CGFloat)fontSize
              isFontBold:(BOOL)isFontBold
             colorHexStr:(NSString *)colorHexStr
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action
{
    return [self sk_title:title fontSize:fontSize isFontBold:isFontBold color:[UIColor hexStr:colorHexStr] target:target action:action];
}


#pragma mark  --------  只设置 image  -------- 

+ (instancetype)sk_image:(UIImage *)image
{
    return [self sk_image:image target:nil action:nil];
}

+ (instancetype)sk_image:(UIImage *)image
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action
{
    return [self sk_image:image imageSelected:nil target:target action:action];
}

+ (instancetype)sk_image:(UIImage *)image 
           imageSelected:(UIImage *)imageSelected
{
    return [self sk_image:image imageSelected:imageSelected target:nil action:nil];
}

+ (instancetype)sk_image:(UIImage *)image 
           imageSelected:(UIImage *)imageSelected
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action
{
    UIButton *bt = [[UIButton alloc] init];
    if (image != nil) {
        [bt setImage:image forState:UIControlStateNormal];
    }
    if (imageSelected != nil) {
        [bt setImage:imageSelected forState:UIControlStateSelected];
    }
    
    if (target != nil && action != nil) {
        [bt addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    return bt;
}





+ (instancetype)sk_imageName:(NSString *)imageName
{
    return [self sk_imageName:imageName target:nil action:nil];
}

+ (instancetype)sk_imageName:(NSString *)imageName
                      target:(_Nullable id)target
                      action:(_Nullable SEL)action
{
    return [self sk_imageName:imageName imageNameSelected:@"" target:target action:action];
}


+ (instancetype)sk_imageName:(NSString *)imageName
           imageNameSelected:(NSString *)imageNameSelected
{
    return [self sk_imageName:imageName imageNameSelected:imageNameSelected target:nil action:nil];
}

+ (instancetype)sk_imageName:(NSString *)imageName
           imageNameSelected:(NSString *)imageNameSelected
                  target:(_Nullable id)target
                  action:(_Nullable SEL)action
{
    return [self sk_image:imageName.length > 0 ? [UIImage imageNamed:imageName] : nil 
            imageSelected:imageNameSelected.length > 0 ? [UIImage imageNamed:imageNameSelected] : nil 
                   target:target action:action];
}


#pragma mark  --------  同时设置 title 与 image  -------- 







@end
