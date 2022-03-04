//
//  SKRectangleToastView.m
//
//  Created by Sky-work on 2022/3/3.
//

#import "SKRectangleToastView.h"



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







@interface SKRectangleToastView ()

@property (nonatomic, assign) int count;

@property (nonatomic, copy) NSString *msg;
@property (nonatomic, assign) NSTimeInterval delay;
@property (nonatomic, assign) SKRectangleToastPosition position;

@property (nonatomic, strong) UILabel *lblMsg;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation SKRectangleToastView

+ (instancetype)shared {
    static id _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[[self class] alloc] init];
    });
    
    return _instance;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    // 宽高固定，位置可调
    self = [super initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width - 100, 52)];
    if (self) {
        // 默认值
        _msg = @"";
        _delay = 3.0;
        _position = toastPositionMiddle;
        
        [self setupUI]; //视图
    }
    return self;
}


+ (instancetype)showMsg:(NSString *)msg
{
    return [self showMsg:msg delay:3.0];
}

+ (instancetype)showMsg:(NSString *)msg delay:(NSTimeInterval)delay
{
    return [self showMsg:msg delay:delay position:toastPositionMiddle];
}

+ (instancetype)showMsg:(NSString *)msg position:(SKRectangleToastPosition)position
{
    return [self showMsg:msg delay:3.0 position:position];
}

+ (instancetype)showMsg:(NSString *)msg delay:(NSTimeInterval)delay position:(SKRectangleToastPosition)position
{
    SKRectangleToastView *toast = SKRectangleToastView.shared;
    toast.msg = msg;
    toast.delay = delay;
    toast.position = position;
    
    // show
    [toast __show];
    
    return toast;
}




- (void)setupUI {
    self.backgroundColor = [UIColor hex:0x030815 alpha:0.8];
    self.layer.cornerRadius = 8;
    self.layer.masksToBounds = YES;
    
    [self addSubview:self.lblMsg];
    self.lblMsg.center = self.center;
}



- (void)__show {
    NSLog(@"__show msg=%@", _msg);
    
    if (_count > 0) {
        [self removeFromSuperview];
        [self invalidateTimer];
        _count -= 1;
    }
    
    _count += 1;
    self.lblMsg.text = _msg;
    [UIApplication.sharedApplication.keyWindow addSubview:self];
    [self setupPosition];
    
    self.alpha = 0;
    [UIView animateWithDuration:0.15 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:self.delay target:self selector:@selector(timerAction:) userInfo:nil repeats:NO];
    }];
}

- (void)__dismiss {
    NSLog(@"__dismiss");
    [self invalidateTimer];
    
    [UIView animateWithDuration:0.15 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        self.count -= 1;
    }];
}



- (void)timerAction:(NSTimer *)sender {
    NSLog(@"haha");
    [self __dismiss];
}

- (void)invalidateTimer {
    NSLog(@"invalidateTimer");
    [self.timer invalidate];
    self.timer = nil;
}




#pragma mark -  setter & getter

- (void)setupPosition {
    CGPoint baseCenter = self.superview.center;
    CGFloat HEIGHT = UIScreen.mainScreen.bounds.size.height;
    switch (_position) {
        case toastPositionTop:
            self.center = CGPointMake(baseCenter.x, HEIGHT/3);
            break;
        case toastPositionMiddle:
            self.center = self.superview.center;
            break;
        case toastPositionBottom:
            self.center = CGPointMake(baseCenter.x, HEIGHT/3 * 2);
            break;
    }
}


- (UILabel *)lblMsg {
    if (!_lblMsg) {
        _lblMsg = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width - 20, self.bounds.size.height)];
        _lblMsg.text = @"  ";
        _lblMsg.font = [UIFont systemFontOfSize:14];
        _lblMsg.textColor = UIColor.whiteColor;
        _lblMsg.numberOfLines = 0;
        
        _lblMsg.textAlignment = NSTextAlignmentCenter;
    }
    return _lblMsg;
}


@end
