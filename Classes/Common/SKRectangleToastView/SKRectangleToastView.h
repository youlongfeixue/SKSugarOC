//
//  SKRectangleToastView.h
//
//  Created by Sky-work on 2022/3/3.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SKRectangleToastPosition) {
    toastPositionTop,
    toastPositionMiddle,
    toastPositionBottom
};

NS_ASSUME_NONNULL_BEGIN

/// 矩形toast提示框-自动消失（默认屏幕中间，且3s后消失）
@interface SKRectangleToastView : UIView

+ (instancetype)showMsg:(NSString *)msg;
+ (instancetype)showMsg:(NSString *)msg delay:(NSTimeInterval)delay;
+ (instancetype)showMsg:(NSString *)msg position:(SKRectangleToastPosition)position;
+ (instancetype)showMsg:(NSString *)msg delay:(NSTimeInterval)delay position:(SKRectangleToastPosition)position;

@end

NS_ASSUME_NONNULL_END
