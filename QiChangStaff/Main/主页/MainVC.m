//
//  MainVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/3/27.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "MainVC.h"
#import "AppDelegate.h"
#import <UILabel+Extension.h>
@interface MainVC ()

@property (strong, nonatomic) UIImageView * icon;
@property (strong, nonatomic) UILabel *typeLabel;
@property (strong, nonatomic) UILabel *numLabel;
@property (strong, nonatomic) NSMutableArray<UIButton *> *btns;





@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
      self.title = @"主页";
      self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
      self.navigationItem.rightBarButtonItem = [MainVC obtainBackItemWithTarget:self action:@selector(logout)];
    // Do any additional setup after loading the view from its nib.
    // 初始化view
    [self setAllInitSubView];
    // 布局样式
    [self setAllSubViewLayout];
    // 更新数据
    [self updateAllData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [[UINavigationBar appearance] setTranslucent:YES];
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.barTintColor = YTYRGB(55, 157, 205);
  
}

#pragma mark - 初始化设置
- (void)setAllInitSubView {
  
//    self.view.backgroundColor = UIColor.grayColor;
    
    self.icon = [[UIImageView alloc] initWithImage:[UIImage new]];
    self.icon.contentMode = UIViewContentModeScaleAspectFit;
    [self.icon setViewBorderCornerRadius:(YTY_DP_375(70)/2) borderWidth:1 borderColor:UIColor.grayColor];
    [self.view addSubview:self.icon];
    
    
    self.typeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.typeLabel setFont:[UIFont systemFontOfSize:10]];
    self.typeLabel.textColor = UIColor.whiteColor;
    self.typeLabel.textAlignment = NSTextAlignmentCenter;
    self.typeLabel.backgroundColor = YTYRGBA(131, 58, 113, 1);
    [self.typeLabel setViewBorderCornerRadius:7 borderWidth:0 borderColor:UIColor.clearColor];
    [self.view addSubview:self.typeLabel];
//     [cell.orderDateLabel setRangeOfString:@"\n" lineSpacing:10 firstFont:setArialFont(14) firstColor:UIColor.blackColor tailFont:[UIFont systemFontOfSize:16 weight:UIFontWeightBold] tailColor:YTYRGBA(88, 85, 85, 1)];
    
    self.numLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.numLabel.textAlignment = NSTextAlignmentCenter;
    self.numLabel.textColor = UIColor.whiteColor;
    self.numLabel.numberOfLines = 3;
    self.numLabel.backgroundColor = UIColor.blueColor;
    [self.view addSubview:self.numLabel];
    
    self.btns = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
       UIButton *btn = [[UIButton alloc] init];
       btn.backgroundColor = YTYRGBA(81, 165, 216, 1);
       btn.layer.cornerRadius = 3;
        btn.layer.borderWidth = 2;
        btn.layer.borderColor = UIColor.greenColor.CGColor;
       CAGradientLayer * layer = [YTYTools obtainGradientLayerWithFrame:CGRectMake(0, 0, YTY_DP_375(250), YTY_DP_375(44)) cornerRadius:3];
       [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
       [btn.layer addSublayer:layer];
       [self.view addSubview:btn];
        [self.btns addObject:btn];
    }
    
   
}

- (void)setAllSubViewLayout {
   [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
          make.centerX.equalTo(self.view);
          make.top.equalTo(self.view).with.offset( SCREEN_NAV_BAR + YTY_DP_375(40));
          make.width.mas_equalTo(YTY_DP_375(70));   //equalTo(self.view).multipliedBy(0.7);
          make.height.mas_equalTo(YTY_DP_375(70));
   }];
    
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.icon.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(YTY_DP_375(14));
    }];

    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           make.centerX.equalTo(self.view);
           make.top.equalTo(self.typeLabel.mas_bottom).with.offset(YTY_DP_375(30));
           make.width.mas_equalTo(YTY_DP_375(250));
           make.height.mas_equalTo(YTY_DP_375(50));
     }];
    
    for (int j = 0; j < self.btns.count; j++) {
        // + t   + h
        CGFloat t = (j *10) + 10  + (j * (50 + 19));
        
        [self.btns[j] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.view);
                make.top.equalTo(self.numLabel.mas_bottom).with.offset(t);
                make.width.mas_equalTo(YTY_DP_375(250));
                make.height.mas_equalTo(YTY_DP_375(44));
         }];
    }
    
//
//    [self.inputPassword mas_makeConstraints:^(MASConstraintMaker *make) {
//          make.centerX.equalTo(self.view);
//          make.top.equalTo(self.inputE_mail.mas_bottom).with.offset(YTY_DP_375(32));
//          make.width.mas_equalTo(YTY_DP_375(229));
//          make.height.mas_equalTo(YTY_DP_375(38));
//    }];
//
//    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
//        make.top.equalTo(self.inputPassword.mas_bottom).with.offset(YTY_DP_375(62));
//        make.width.mas_equalTo(YTY_DP_375(229));
//        make.height.mas_equalTo(YTY_DP_375(38));
//    }];
    
    
}

- (void)updateAllData {
    self.icon.image = [UIImage imageNamed:@"logo"];
    self.typeLabel.text = @"管理员";
    self.numLabel.text = @"陈主任\n983726";
    [self.numLabel setRangeOfString:@"\n" lineSpacing:8 firstFont:[UIFont systemFontOfSize:18 weight:UIFontWeightBold] firstColor:UIColor.blackColor tailFont:[UIFont systemFontOfSize:15] tailColor:UIColor.grayColor];
    
//    [self.inputE_mail setDesLabelText:@"用戶名稱" desLabelFont:[UIFont systemFontOfSize:14.0 weight:UIFontWeightHeavy] desLabelColor:[UIColor blackColor]];
//    [self.inputPassword setDesLabelText:@"密碼" desLabelFont:[UIFont systemFontOfSize:14.0 weight:UIFontWeightHeavy] desLabelColor:[UIColor blackColor]];
//    [self.loginBtn setTitle:@"登錄" forState:UIControlStateNormal];
}





+ (UIBarButtonItem *)obtainBackItemWithTarget:(nullable id)target action:(nullable SEL)action {
       UIImage *backImage = [[UIImage imageNamed:@"退出"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
        
        // 自定义VIew
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame =CGRectMake(-50, 0, 45, 45); //CGRectMake(-40, 0, 45, 45);
    //    button.backgroundColor =UIColor.redColor;
        button.imageEdgeInsets =  UIEdgeInsetsMake(0, 0, 0, 26);
    //    [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setImage:backImage forState:UIControlStateNormal];
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
     //   self.navigationItem.leftBarButtonItem = backButtonItem;
    return backButtonItem;
}

- (void)logout {
    [AppDelegate logout];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
