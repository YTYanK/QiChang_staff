//
//  LoginVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/3/27.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "LoginVC.h"
//#import "MainVC.h"
#import "AppDelegate.h"

@interface LoginVC()
@property (strong, nonatomic) UIImageView *logoImageView;
@property (strong, nonatomic) UIImageView *titleImageView;
@property (strong, nonatomic) YTYView * inputE_mail;
@property (strong, nonatomic) YTYView * inputPassword;
@property (strong, nonatomic) UIButton *loginBtn;
@end

@implementation LoginVC


- (void)viewDidLoad {
    [super viewDidLoad];
    //注册通知,进行监听当前状态
    [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(showKeyboard:)
                                                     name:UIKeyboardDidShowNotification
                                                   object:nil];
    // 初始化view
    [self setAllInitSubView];
    // 布局样式
    [self setAllSubViewLayout];
    // 更新数据
    [self updateAllData];
}




#pragma mark - 初始化设置
- (void)setAllInitSubView {
  
//    self.view.backgroundColor = UIColor.grayColor;
    
    self.logoImageView = [[UIImageView alloc] initWithImage:[UIImage new]];
    self.logoImageView.contentMode = UIViewContentModeScaleAspectFit;

    [self.view addSubview:self.logoImageView];
    
    
    self.titleImageView = [[UIImageView alloc] initWithImage:[UIImage new]];
    self.titleImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.titleImageView];
       
    //
    self.inputE_mail = [[YTYView alloc] initInputStyle:InputDepictTitle withFrame:CGRectZero];
    [self.inputE_mail setBorderValue:YTY_DP_375(2.0)];
    [self.inputE_mail setBorderCornerRadius:4.0];
    [self.inputE_mail setLeftView:5];
    [self.view addSubview:self.inputE_mail];
       
       
       
    self.inputPassword = [[YTYView alloc] initWithFrame:CGRectZero];
    [self.inputPassword updateInputStyle:InputDepictTitle];
    [self.inputPassword setBorderValue:YTY_DP_375(2.0)];
    [self.inputPassword setBorderCornerRadius:4.0];
    [self.inputPassword setLeftView:5];
    [self.view addSubview:self.inputPassword];

    
    self.loginBtn = [[UIButton alloc] init];
    self.loginBtn.backgroundColor = YTYRGBA(81, 165, 216, 1);
    self.loginBtn.layer.cornerRadius = 3;
    [self.loginBtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginBtn];
}

- (void)setAllSubViewLayout {
   [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.centerX.equalTo(self.view);
          make.top.equalTo(self.view).with.offset(YTY_DP_375(120));
          make.width.mas_equalTo(YTY_DP_375(118));   //equalTo(self.view).multipliedBy(0.7);
          make.height.mas_equalTo(YTY_DP_375(113));
   }];
    
    [self.titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.logoImageView.mas_bottom).with.offset(YTY_DP_375(26));
        make.width.mas_equalTo(YTY_DP_375(130));
        make.height.mas_equalTo(YTY_DP_375(23));
    }];
    
    [self.inputE_mail mas_makeConstraints:^(MASConstraintMaker *make) {
           make.centerX.equalTo(self.view);
           make.top.equalTo(self.titleImageView.mas_bottom).with.offset(YTY_DP_375(32));
           make.width.mas_equalTo(YTY_DP_375(229));
           make.height.mas_equalTo(YTY_DP_375(38));
     }];
    
    [self.inputPassword mas_makeConstraints:^(MASConstraintMaker *make) {
          make.centerX.equalTo(self.view);
          make.top.equalTo(self.inputE_mail.mas_bottom).with.offset(YTY_DP_375(32));
          make.width.mas_equalTo(YTY_DP_375(229));
          make.height.mas_equalTo(YTY_DP_375(38));
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.inputPassword.mas_bottom).with.offset(YTY_DP_375(62));
        make.width.mas_equalTo(YTY_DP_375(229));
        make.height.mas_equalTo(YTY_DP_375(38));
    }];
    
    
}

- (void)updateAllData {
    self.logoImageView.image = [UIImage imageNamed:@"logo"];
    self.titleImageView.image = [UIImage imageNamed:@"員工登入口"];
    [self.inputE_mail setDesLabelText:@"用戶名稱" desLabelFont:[UIFont systemFontOfSize:14.0 weight:UIFontWeightHeavy] desLabelColor:[UIColor blackColor]];
    [self.inputPassword setDesLabelText:@"密碼" desLabelFont:[UIFont systemFontOfSize:14.0 weight:UIFontWeightHeavy] desLabelColor:[UIColor blackColor]];
    [self.loginBtn setTitle:@"登錄" forState:UIControlStateNormal];
}

#pragma mark - 按钮事件
- (void)loginClick:(UIButton *)sender {
    // 测试
//    [self.inputE_mail updateInputValue:@"872825564@qq.com"];
//    [self.inputPassword updateInputValue:@"123456"];
//
//    if (![UILabel validateEmail:self.inputE_mail.inputValue]) {
//        [MBProgressHUD showError:@"请输入正确的邮箱" toView:self.view];
//        return;
//    }
//
//    if (!(self.inputPassword.inputValue.length > 5)) {
//        [MBProgressHUD showError:@"请输入大于6位数密码" toView:self.view];
//        return;
//    }
//    NSDictionary *dic = @{@"login": self.inputE_mail.inputValue, @"password": self.inputPassword.inputValue, @"account_type" : @"999"};
//    [NSUD setValue:@"c" forKey:LOGIN_TOKEN];
//   [QiChangApi requestWithUrl:AULogin parameters:dic method:NetMethodPOST returnModel:^(id  _Nonnull model) {
//
//       [[YYCache cacheWithName:CACHE_LOGIN] setObject:model forKey:CACHE_LOGIN_KEY];
//       [QiChangApi sharedQiChangApi].userModel = [UserModel yy_modelWithDictionary:model];
//       [NSUD setValue:[QiChangApi sharedQiChangApi].userModel.session_id forKey:LOGIN_TOKEN];
//
//
//       [self dismissViewControllerAnimated:YES completion:nil];
//   } returnError:^(id  _Nonnull error) {
//       [MBProgressHUD showError:error toView:self.view];
//   }];
    
   AppDelegate * appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    
    

      UIWindow* window = nil;
     
        if (@available(iOS 13.0, *)) {
            for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes)
            {
                    if (windowScene.activationState == UISceneActivationStateForegroundActive)
                    {
                        window = windowScene.windows.firstObject;

                        break;
                    }
            }
        }else{
             window = [UIApplication sharedApplication].keyWindow;
        }
    
    UINavigationController *nav = [[UINavigationController  alloc] initWithRootViewController:appDelegate.mainAdmin];
    
//    [self presentViewController:nav animated:YES completion:^{
        window.rootViewController = nav;
        [window makeKeyWindow];
//    }];
    
    
    
}
// 监控键盘显示
- (void)showKeyboard:(NSNotificationCenter *)sender{
    [self.view addGestureRecognizer:[YTYTools obtainTapGestureRecognizerObjectWithAction:@selector(hideKeyboard:) withTarget:self]];
}
- (void)hideKeyboard:(UIGestureRecognizer *)sender {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

// 释放
- (void)dealloc {
   [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
