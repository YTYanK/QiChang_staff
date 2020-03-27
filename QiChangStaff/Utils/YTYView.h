//
//  YTYView.h
//  QiChang
//
//  Created by POP3mac on 2020/2/20.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/** InputView 类型*/
typedef enum : NSUInteger {
      /// 普通类型
      InputDefault = 0,
      InputLine  = 1,  //加横线
      /// 带标题
      InputDepictTitle = 2,
      ///  title ，可以换成图片
      InputDepictTitleOrRightTitle = 3,
      ///
      InputText = 4,
} InputStyle;


typedef void(^ValueBlock)(UITextField *textField);

@protocol YTYViewDelegate <NSObject>
@optional
- (void)sendCode:(UIButton *)sender;
//- (void)fieldClick:(UIButton *)sender;
//- (void)textFieldClick:(UITextField *)text;
@end


@interface YTYView : UIView

@property (weak, nonatomic) id<YTYViewDelegate>delegate;
//@property (nonatomic) ValueBlock textFieldBlock;
/// 键盘类型
@property (nonatomic) UIKeyboardType keyboardType;
/// 输入内容的最大长度
@property (nonatomic) NSInteger maxLength;

/// 是否开启密码模式 - 默认 false
@property (nonatomic) BOOL secureTextEntry;
/// 是否可以编辑 开启 = YSE， NO = 禁止
@property (nonatomic) BOOL enabled;
@property (assign, nonatomic) UITextFieldViewMode clearButtonMode;
/// 针对于 InputDepictTitle  模式下的t标题设置
/// 标题内容
@property (nullable, nonatomic, copy) NSString *text;
/// 标题颜色
@property (nullable, nonatomic, copy) UIColor *textColor;
/// 标题字体
@property (nullable, nonatomic, copy) UIFont *textFont;

/// 提示内容
@property (nullable, nonatomic, copy) NSString *placeholder;
/// 提示内容-颜色 - back
@property (nullable, nonatomic, copy) UIColor *placeholderColor;
/// 提示内容-字体 - 12 pt
@property (nullable, nonatomic, copy) UIFont *placeholderFont;
/// textField 的值
@property (nullable, copy, readonly) NSString * inputValue;

/// 输入框背景颜色
@property (nullable, copy, nonatomic) UIColor *inputBgColor;
///  按钮布局设置
@property (nonatomic) CGRect verificationBtnFrame;

///  按钮
@property (strong, nonatomic) UIButton *verificationBtn;

//+ (void)initialize;
- (instancetype)initInputStyle:(InputStyle)style  withFrame:(CGRect)frame; // NS_DESIGNATED_INITIALIZER;
/*
    //frame 设置内置的view 的frame 
 */
- (instancetype)initWithFrame:(CGRect)frame;

///  更新模式
- (void)updateInputStyle:(InputStyle)style;
/**
  设置边框宽度 -  默认 0 
*/
- (void)setBorderValue:(CGFloat)xy;
/**
 设置边框圆角
*/
- (void)setBorderCornerRadius:(CGFloat)value;
/**
  设置边框渐变颜色（双色）
*/
- (void)setGradientLayerColor:(UIColor *)startColor transitionTo:(UIColor *)endColor;

/**
  设置placeholder 字体、颜色
*/
- (void)setPlaceholder:(NSString *)placeholder placeholderColor:(UIColor *)color placeholderFont:(UIFont *)font;

/**
  verificationBtn  设置标题、字体 、颜色修改
*/
- (void)setVerificationBtnText:(NSString *)text font:(UIFont *)font color:(UIColor *)color forState:(UIControlState)state;

/**
  verificationBtn  设置图片按钮
*/
- (void)setVerificationBtnImage:(UIImage *)image forState:(UIControlState)state;

/**
  占位缩进单位
 */
- (void)setLeftView:(CGFloat)width;
/**
  desLabel  设置字体 、颜色修改
 */
- (void)setDesLabelText:(NSString *)text desLabelFont:(UIFont *)font desLabelColor:(UIColor *)color;
/**
    更新输入框的值
 */
- (void)updateInputValue:(NSString *)value;

- (void)inputViewResignFirstResponder;

@end

NS_ASSUME_NONNULL_END
