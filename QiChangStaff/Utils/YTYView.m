//
//  YTYView.m
//  QiChang
//
//  Created by POP3mac on 2020/2/20.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "YTYView.h"
//#import <YTYCoreFramework/UIView+RGSize.h>
@interface YTYView ()<UITextFieldDelegate, UITextViewDelegate>
{
    CGFloat _xy; // 边框粗细
    CGFloat _cornerRadius; // 圆角
    CAGradientLayer * _gradientLayer;  //颜色层
    NSString * _placeholder; // 提示
    UIColor *_placeholderColor; // 颜色
    UIFont *_placeholderFont; // 字体
    NSString *_text;
    UIColor *_textColor;
    UIFont *_textFont;
    BOOL _isSetRadius;
    
}

@property (strong, nonatomic) UITextField *inputView;
@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) UIView *line;
@property (strong, nonatomic) UILabel *desLabel; // designation Label
//@property (strong, nonatomic) UIButton * verificationBtn; //InputDepictTitleOrRightTitle
//@property (strong, nonatomic) UIButton *sendBnt;


@property (nonatomic) CGRect builtInFrame;
/// 输入框类型
@property (nonatomic, assign) InputStyle style;

@end


@implementation YTYView
@synthesize placeholder;
@synthesize placeholderColor;
@synthesize placeholderFont;
@synthesize text;
@synthesize textColor;
@synthesize textFont;

- (UITextField *)inputView {
    if(!_inputView) {
        _inputView = [[UITextField alloc] init];
        
    }
    return _inputView;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] init];
    }
    return _textView;
}


- (UIView *)line {
    if(!_line) {
        _line = [[UIView alloc] init];
    }
    return _line;
}

- (UILabel *)desLabel {
    if(!_desLabel) {
        _desLabel = [[UILabel alloc] init];
    }
    return _desLabel;
}


- (UIButton *)verificationBtn {
    if (!_verificationBtn) {
        _verificationBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    }
    return _verificationBtn;
}

/// placeholder 提示内容
- (NSString *)placeholder {
    if (!_placeholder) {
        _placeholder = @"";
    }
    return _placeholder;
}
- (void)setPlaceholder:(NSString *)placeholder {
    if (_placeholder != placeholder) {
        _placeholder = placeholder;
        
         [self setPlaceholder:_placeholder placeholderColor:self.placeholderColor placeholderFont:self.placeholderFont];
    }
}

- (void)setTag:(NSInteger)tag {
    [super setTag:tag];
    self.inputView.tag = tag;
    self.textView.tag = tag;
    self.verificationBtn.tag = tag;
}

/// placeholder 颜色修改
- (UIColor *)placeholderColor {
   if (!_placeholderColor) {
       _placeholderColor = UIColor.grayColor;
   }
   return _placeholderColor;
}
- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    if (_placeholderColor != placeholderColor) {
        _placeholderColor = placeholderColor;
        [self setPlaceholder:self.placeholder placeholderColor:_placeholderColor placeholderFont:self.placeholderFont];
    }
}
/// placeholder 字体修改
- (UIFont *)placeholderFont {
    if (!_placeholderFont) {
        _placeholderFont = [UIFont systemFontOfSize:12.0];
    }
    return _placeholderFont;
    
}
- (void)setPlaceholderFont:(UIFont *)placeholderFont {
   if (_placeholderFont != placeholderFont) {
          _placeholderFont = placeholderFont;
       [self setPlaceholder:self.placeholder placeholderColor:self.placeholderColor placeholderFont:_placeholderFont];
      }
}

/// placeholder 带颜色修改及字体大小
- (void)setPlaceholder:(NSString *)placeholder placeholderColor:(UIColor *)color placeholderFont:(UIFont *)font {
  NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName: font}];
  self.inputView.attributedPlaceholder = attrString;
}
//  最大输入字数
- (void)setMaxLength:(NSInteger)maxLength {
    _maxLength = maxLength;
    self.inputView.maxLength = _maxLength;
}
//  设置是否可以输入
- (void)setEnabled:(BOOL)enabled {
    if (self.style == InputText) {
         self.textView.editable = enabled; //设置是否允许编辑内容
    }else {
        self.inputView.enabled = enabled;
    }
   
}
// 密码模式
- (void)setSecureTextEntry:(BOOL)secureTextEntry {
    self.inputView.secureTextEntry = secureTextEntry;
}

// 背景颜色
- (void)setInputBgColor:(UIColor *)inputBgColor {
    if (self.style == InputText) {
        self.textView.backgroundColor = inputBgColor;
    }else {
        self.inputView.backgroundColor = inputBgColor;
    }
}

- (void)setVerificationBtnFrame:(CGRect)verificationBtnFrame {
    _verificationBtnFrame = verificationBtnFrame;
}



/// 占位缩进
- (void)setLeftView:(CGFloat)width  {
    if (self.style == InputText) {
        //??
    }else {
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, self.inputView.frame.size.height)];
        leftView.backgroundColor = UIColor.clearColor;
        self.inputView.leftView = leftView;
        self.inputView.leftViewMode = UITextFieldViewModeAlways;
    }
}

/// 设置内置 View Frame
- (void)setBuiltInFrame:(CGRect)builtInFrame {
    _builtInFrame = builtInFrame;
    CGFloat wh = _xy * 2;
    if (self.style == InputText) {
        self.textView.frame =  CGRectMake( _builtInFrame.origin.x  + _xy, _builtInFrame.origin.y + _xy,  _builtInFrame.size.width - wh, _builtInFrame.size.height - wh);
        
        if (_isSetRadius) {
             _isSetRadius = NO;
             [self setTextViewRadiusCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)  cornerRadii:CGSizeMake(_xy, _xy)];
        }
    }else {
        self.inputView.frame =  CGRectMake( _builtInFrame.origin.x  + _xy, _builtInFrame.origin.y + _xy,  _builtInFrame.size.width - wh, _builtInFrame.size.height - wh);
        
        if (_isSetRadius) {
              _isSetRadius = NO;
              [self setInputViewRadiusCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)  cornerRadii:CGSizeMake(_xy, _xy)];
        }
    }
    
   
}
- (void)layoutSubviews  {
    [super layoutSubviews];
    // 重置self
    [self updateBuiltInFrame:self.frame];
    
}


#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame {
     return [self initInputStyle:InputDefault withFrame:frame];
}
///  建议使用初始化方法
- (instancetype)initInputStyle:(InputStyle)style  withFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
         _isSetRadius  = NO;
         //设置默认样式
         [self updateInputStyle:style];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [self initInputStyle:InputDefault withFrame:CGRectZero]; // [super initWithCoder:coder];
     if (self) {
     }
     return self;
}

// 更新输入框值
- (void)updateInputValue:(NSString *)value {
    _inputValue = value;
    if (_style == InputText) {
        self.textView.text = value;
    }else {
        self.inputView.text = value;
    }
    
}

// 设置frame
- (void)updateBuiltInFrame:(CGRect)frame {
         // 重置self.inputView
        CGFloat builtY = 0;
        CGFloat builtH = 0;
        if (_style == InputDepictTitle) {
            self.desLabel.frame = CGRectMake(2, 0, frame.size.width - 4, YTY_DP_375(20));//11.7
            builtY = self.desLabel.frame.size.height;
            builtH = frame.size.height;
            frame.size.height = frame.size.height  + self.desLabel.frame.size.height;
           
        }else if(_style == InputDepictTitleOrRightTitle) {
              self.desLabel.frame = CGRectMake(2, 0, frame.size.width - 4, YTY_DP_375(20));//11.7
              builtY = self.desLabel.frame.size.height;
              builtH = frame.size.height;
            
              frame.size.height = frame.size.height  + self.desLabel.frame.size.height;
              
            if (!CGRectEqualToRect(self.verificationBtn.frame, self.verificationBtnFrame) ) {
                self.verificationBtn.backgroundColor = UIColor.yellowColor;
                CGFloat x = (((frame.size.width * 0.3/2) -  self.verificationBtnFrame.size.width/2 ) + frame.size.width * 0.7);
                self.verificationBtn.frame = CGRectMake(x,  (builtH/2 - self.verificationBtnFrame.size.height/2   +  builtY),self.verificationBtnFrame.size.width, self.verificationBtnFrame.size.height);
            }else {
//
////                 [self setVerificationBtnText:@"发送验证码" font:[UIFont systemFontOfSize:12.0 weight:UIFontWeightHeavy] color:UIColor.greenColor forState:UIControlStateNormal];
////                self.verificationBtn.titleLabel.frame = CGRectMake(0, 0, 100, 22);
//
                self.verificationBtn.backgroundColor = UIColor.yellowColor;
                  self.verificationBtn.frame =  CGRectMake(165, 28, 100, 30);// CGRectMake(frame.size.width * 0.6, builtY, frame.size.width * 0.3, builtH);
//
            }
            
        
        }
        else if(_style == InputText) {
             self.desLabel.frame = CGRectMake(2, 0, frame.size.width - 4, YTY_DP_375(20));//11.7
                 builtY = self.desLabel.frame.size.height;
                 builtH = frame.size.height;
                 frame.size.height = frame.size.height  + self.desLabel.frame.size.height;
        }
        else {
            builtY = 0;
            builtH = frame.size.height;
        }
    
       if(_style != InputDepictTitleOrRightTitle) {
         self.builtInFrame = CGRectMake(0, builtY, frame.size.width, builtH);
         _gradientLayer.frame = self.builtInFrame;

       }else {
           self.builtInFrame = CGRectMake(0, builtY, frame.size.width * 0.7, builtH);
           _gradientLayer.frame = CGRectMake(0, builtY, frame.size.width, builtH);
       }

}


// 更新模式
- (void)updateInputStyle:(InputStyle)style {
    if (self.style != style) {
      [self.line removeFromSuperview];
      [self.verificationBtn removeFromSuperview];
        [self.inputView removeFromSuperview];
        [self.textView removeFromSuperview];
      [self setStyle:style];
    }else { // 没有变化时默认值
        [self setInputDefault];
    }
     
}
#pragma mark -  模式选择方法
- (void)setStyle:(InputStyle)style {
    if (_style != style) {  // 改变时加入
        _style = style;
        
        switch (_style) {
                case InputLine:
                // 暂时没有下划线
//                    [self setInputLine];
                    break;
                case InputDepictTitle:
                    [self setInputDepictTitle];
                    break;
                case InputDepictTitleOrRightTitle:
                   [self setInputDepictTitleOrRightTitle];
                   break;
                
               case InputText:
                  [self setInputText];
                break;
                default:
//                    [self setInputDefault];
                   
                    break;
            }
    }else { // 没有变化时默认值
        [self setInputDefault];
    }
}
    


/*
  - 数据
  - 初始化对象
  - 布局
 
 // 数据驱动
 // 数据填充
 
 */
/// MARK: 初始化界面

/// MARK: Default 样式是统一的基础样式
- (void)setInputDefault {
    self.inputView.backgroundColor = UIColor.whiteColor;
    self.inputView.placeholder = @"";
    self.inputView.delegate = self;
    [self setInputViewBorder];
    [self addSubview: self.inputView];
}
/// 设置边框宽度
- (void)setBorderValue:(CGFloat)xy {
    _xy = xy;
    CGFloat wh = _xy * 2;
    //更新frame // self.builtInFrame
    
    if (self.style == InputText) {
        self.textView.frame =  CGRectMake( self.builtInFrame.origin.x  + _xy, self.builtInFrame.origin.y + _xy,  self.builtInFrame.size.width - wh, self.builtInFrame.size.height - wh);
    }else {
        self.inputView.frame =  CGRectMake( self.builtInFrame.origin.x  + _xy, self.builtInFrame.origin.y + _xy,  self.builtInFrame.size.width - wh, self.builtInFrame.size.height - wh);
    }
    
     
}
/// 设置边框圆角
- (void)setBorderCornerRadius:(CGFloat)value {
     _cornerRadius = value;
     
     _gradientLayer.cornerRadius = _cornerRadius;
    if (self.style == InputDepictTitleOrRightTitle) {
         _isSetRadius  = YES;
    }else {
        if (self.style == InputText) {
             self.textView.layer.cornerRadius = _cornerRadius;
        }else {
            self.inputView.layer.cornerRadius = _cornerRadius;
        }
    }
}
/// 给 inputView 设置：圆角
- (void)setInputViewRadiusCorners:(UIRectCorner)corners  cornerRadii:(CGSize)cornerRadii  {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.inputView.size.width, self.inputView.size.height)
                                                   byRoundingCorners:corners   //UIRectCornerBottomLeft | UIRectCornerBottomRight
                                                         cornerRadii:cornerRadii];   //CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = CGRectMake(0, 0, self.inputView.size.width, self.inputView.size.height);
    maskLayer.path = maskPath.CGPath;
    self.inputView.layer.mask = maskLayer;
}

/// 给 textView 设置：圆角
- (void)setTextViewRadiusCorners:(UIRectCorner)corners  cornerRadii:(CGSize)cornerRadii  {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.textView.size.width, self.textView.size.height)
                                                   byRoundingCorners:corners   //UIRectCornerBottomLeft | UIRectCornerBottomRight
                                                         cornerRadii:cornerRadii];   //CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = CGRectMake(0, 0, self.textView.size.width, self.textView.size.height);
    maskLayer.path = maskPath.CGPath;
    self.textView.layer.mask = maskLayer;
}


/// 设置渐变颜色
- (void)setGradientLayerColor:(UIColor *)startColor transitionTo:(UIColor *)endColor {
   _gradientLayer.colors = @[(__bridge id)startColor.CGColor,(__bridge id)endColor.CGColor];
}
/// 设置背景颜色层
- (void)setInputViewBorder {
   _gradientLayer = [YTYTools obtainGradientLayerWithFrame:self.builtInFrame];
    [self.layer addSublayer:_gradientLayer];
}


/// MARK: 带标题输入框模式
-(void)setInputDepictTitle {
    [self setInputDefault];
    // 设置提示标题
    self.desLabel.text = @"请设置标题";
    self.desLabel.textColor = self.textColor;
    self.desLabel.font = self.textFont;
    [self addSubview:self.desLabel];

}

- (void)setKeyboardType:(UIKeyboardType)keyboardType {
    if (_style == InputText) {
         self.textView.keyboardType = keyboardType;
    }else {
        self.inputView.keyboardType = keyboardType;
    }
}

// 标题内容
- (NSString *)text {
     if (!_text) {
         _text = @"";
     }
     return _text;
}
- (void)setText:(NSString *)text {
    if (_text != text) {
        _text = text;
        [self setDesLabelText:_text desLabelFont:self.textFont desLabelColor:self.textColor];
    }
}

 // 标题字体
- (UIFont *)textFont {
   if (!_textFont) {
       _textFont = [UIFont systemFontOfSize:YTY_DP_375(12) weight:UIFontWeightBold];
   }
   return _textFont;
}
- (void)setTextFont:(UIFont *)textFont {
    if (_textFont != textFont) {
        _textFont = textFont;
         [self setDesLabelText:self.text desLabelFont:_textFont desLabelColor:self.textColor];
    }
}

// 标题颜色
- (UIColor *)textColor {
    if (!_textColor) {
        _textColor = [UIColor colorWithRed:73/255.0 green:71/255.0 blue:72/255.0 alpha:1.0];
    }
    return _textColor;
}
- (void)setTextColor:(UIColor *)textColor {
    if (_textColor != textColor) {
        _textColor = textColor;
        [self setDesLabelText:self.text desLabelFont:self.textFont desLabelColor:_textColor];
    }
}

/// desLabel  设置字体 、颜色修改
- (void)setDesLabelText:(NSString *)text desLabelFont:(UIFont *)font desLabelColor:(UIColor *)color{
  NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName: font,NSForegroundColorAttributeName: color}];

  self.desLabel.attributedText = string;
}

/// 带标题输入框模式及按钮
- (void)setInputDepictTitleOrRightTitle {
    [self setInputDepictTitle];
    NSLog(@"带标题输入框模式及验证码按钮--->%s", __func__);
    [self setVerificationBtnText:@"发送验证码" font:[UIFont systemFontOfSize:12.0 weight:UIFontWeightHeavy] color:UIColor.whiteColor forState:UIControlStateNormal];
//    if ([self.delegate respondsToSelector:@selector(sendCode:)]) {
         [self.verificationBtn addTarget:self.delegate action:@selector(sendCode:) forControlEvents:UIControlEventTouchUpInside];
//    }
     [self addSubview:self.verificationBtn];

}

/// verificationBtn  设置字体 、颜色修改
- (void)setVerificationBtnText:(NSString *)text font:(UIFont *)font color:(UIColor *)color forState:(UIControlState)state{
    [self.verificationBtn setTitleColor:color forState:state];
    [self.verificationBtn setTitle:text forState:state];
     self.verificationBtn.titleLabel.font =  font;
}

// 设置图片按钮
- (void)setVerificationBtnImage:(UIImage *)image forState:(UIControlState)state {
    [self setVerificationBtnText:@"" font:[UIFont systemFontOfSize:12] color:UIColor.whiteColor forState:UIControlStateNormal];
    [self.verificationBtn setImage:image forState:state];
}

/// MARK: 多行输入框
- (void)setInputText {
    self.textView.backgroundColor = UIColor.whiteColor;
    self.textView.text = @"";
    self.textView.delegate = self;
    [self setInputViewBorder];
    [self addSubview: self.textView];
    // 设置提示标题
//    NSLog(@"设置提示标题--->%s", __func__);
    self.desLabel.text = @"请设置标题";
    self.desLabel.textColor = self.textColor;
    self.desLabel.font = self.textFont;
    [self addSubview:self.desLabel];
}





/// MARK: UITextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [textField addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
    return YES;
}

- (void)textFieldEditChanged:(UITextField *)textField {
    _inputValue = textField.text;
    self.inputView.text  = textField.text;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"???%@",textField.text);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.inputView) {
        [self inputViewResignFirstResponder];
    }
    return  YES;
}

- (void)inputViewResignFirstResponder {
    [self.inputView resignFirstResponder];
//    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

/// MARK: UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    return YES;
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView {
    _inputValue = textView.text;
    self.textView.text = textView.text;
}


@end
