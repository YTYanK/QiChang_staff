//
//  MainVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/3/27.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "MainVC.h"
#import "AppDelegate.h"

#import <YTYCore.h>
#import "QCSWarehouseVC.h"
#import "QCSWarehouseRecordVC.h"
#import "QCSDeliveryReportVC.h"
#import "QCSOrderMainVC.h"
#import "QCSAreaVC.h"


#import "QCSNewBillVC.h"
// 掃描入倉
#import "QCSWarehousingVC.h"

@interface MainVC ()

@property (strong, nonatomic) UIImageView * icon;
@property (strong, nonatomic) UILabel *typeLabel;
// 其他模式下的正常编号 / 仓管员模式只显示名称
@property (strong, nonatomic) UILabel *numLabel;

// 仓管员模式下显示
@property (strong, nonatomic) UILabel *numberLabel;
@property (strong, nonatomic) UILabel *areaLabel;


// 背景图片
@property (strong, nonatomic) UIImageView * bgImageView;

@property (strong, nonatomic) NSMutableArray<UIButton *> *btns;





@end

@implementation MainVC


- (NSMutableArray *)lists {
    if (_lists == nil) {
        // 司机 --  送貨單 、 本日派送記錄報告
        // 入仓员 --  掃描入倉、倉存記錄、檢查已入倉單、新來貨單到達時間
        // 客服 -- 客戶列表
        // 管理员 -- 客戶列表、本日派送記錄報告、 倉存記錄、 檢查已入倉單

        if ([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual: RoleTypeDriver]) { //司机
           _lists = [NSMutableArray arrayWithArray: @[@"送貨單",@"本日派送記錄報告"]];
        }else if([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual: RoleTypeStorekeeper]) { // 入仓员
           _lists = [NSMutableArray arrayWithArray: @[@"掃描入倉",@"倉存記錄",@"檢查已入倉單",@"新來貨單到達時間"]];
        }else if([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual:RoleTypeCustomerService]) { // 客服
           _lists = [NSMutableArray arrayWithArray: @[@"客戶列表"]];
        }else { // 管理员
           _lists = [NSMutableArray arrayWithArray: @[@"訂單列表",@"本日派送記錄報告",@"倉存記錄",@"檢查已入倉單"]];
        }
        
    }
    return _lists;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //[[UIImage imageNamed:@"退出"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    
      
        if (IS_IPHONE_X) {
            NSLog(@"YES");
        }else {
            NSLog(@"NO");
        }
    
      self.title = @"主页";
      self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
      // 右item
      self.navigationItem.rightBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(logout) image:[[UIImage imageNamed:@"退出"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
       self.view.backgroundColor = NAV_COLOR;
   // NSLog(@"查看角色->%@", [NSUD objectForKey:LOGIN_ROLE_TYPE]);
    
    // 初始化view
    [self setAllInitSubView];
    // 布局样式
    [self setAllSubViewLayout];
    // 更新数据
    [self updateAllData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.backgroundColor = UIColor.redColor

    
// 无效
//    self.navigationController.navigationBar.barTintColor =  YTYRGBA(55, 141, 202,1);   //YTYRGB(55, 157, 205);
  
}

#pragma mark - 初始化设置
- (void)setAllInitSubView {
   
    self.bgImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.bgImageView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.bgImageView];
    
    
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
    
    
    self.numLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.numLabel.textAlignment = NSTextAlignmentCenter;
    self.numLabel.textColor = UIColor.blackColor;
//    self.numLabel.backgroundColor = UIColor.redColor;
    self.numLabel.numberOfLines = 3;
    [self.view addSubview:self.numLabel];
    
    
    if([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual:RoleTypeStorekeeper]) {
        self.areaLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.areaLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:self.areaLabel];
        
         
        self.numberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.numberLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:self.numberLabel];
    }
    
    
    self.btns = [NSMutableArray array];
    
    
    NSLog(@"----》%@",self.lists);
    
    for (int i = 0; i < self.lists.count; i++) {
       UIButton *btn = [[UIButton alloc] init];
        btn.tag = i;
        btn.backgroundColor = YTYRGBA(81, 165, 216, 1);
        [btn setViewBorderCornerRadius:6 borderWidth:2 borderColor:YTYRGBA(217, 213, 212, 1)];
        CAGradientLayer * layer = [YTYTools obtainGradientLayerWithFrame:CGRectMake(0, 0, YTY_DP_375(250), YTY_DP_375(44)) cornerRadius:6];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn.layer addSublayer:layer];
        [self.view addSubview:btn];
        [self.btns addObject:btn];
    }
    
   
}

- (void)setAllSubViewLayout {
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerX.equalTo(self.view);
             make.top.equalTo(self.view).with.offset( SCREEN_NAV_BAR);
             make.width.equalTo(self.view);
             make.height.equalTo(self.view);
    }];
    
    
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
           make.top.equalTo(self.typeLabel.mas_bottom).with.offset(YTY_DP_375(10));
           make.width.mas_equalTo(YTY_DP_375(250));
           make.height.mas_equalTo(YTY_DP_375(50));
     }];
    
     if ([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual:RoleTypeStorekeeper] ) {
         [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
             make.left.equalTo(self.view);
             make.top.equalTo(self.numLabel.mas_bottom).with.offset(YTY_DP_375(10));
             make.width.equalTo(self.view.mas_width).with.multipliedBy(0.5);
             make.height.mas_equalTo(YTY_DP_375(30));
         }];
         [self.areaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
             make.right.equalTo(self.view);
             make.top.equalTo(self.numLabel.mas_bottom).with.offset(YTY_DP_375(10));
             make.width.equalTo(self.view.mas_width).with.multipliedBy(0.5);
             make.height.mas_equalTo(YTY_DP_375(30));
         }];
         
         
         
         for (int j = 0; j < self.btns.count; j++) {
               // + 头部距离   + 间距
               CGFloat t = (j *10) + 30  + (j * (50 + 10));
               
               [self.btns[j] mas_makeConstraints:^(MASConstraintMaker *make) {
                       make.centerX.equalTo(self.view);
                       make.top.equalTo(self.areaLabel.mas_bottom).with.offset(t);
                       make.width.mas_equalTo(YTY_DP_375(250));
                       make.height.mas_equalTo(YTY_DP_375(44));
                }];
           }
     
     }else {
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
     
     }
    
   
}

- (void)updateAllData {
    self.icon.image = [UIImage imageNamed:@"logo"];
    self.typeLabel.text =  [NSUD objectForKey:LOGIN_ROLE_TYPE];
    
    // 获取登录角色类型
    if ([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual:RoleTypeStorekeeper]) {
      self.numLabel.text = @"陈主任";
        self.numberLabel.text = @"員工編號 983726";
        self.areaLabel.text = @"所屬倉庫 九龍";
        
        self.numLabel.textColor = UIColor.blackColor;
        self.numLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
        [self.numberLabel setRangeOfString:@" " lineSpacing:0 firstFont:[UIFont systemFontOfSize:16] firstColor:UIColor.grayColor tailFont:[UIFont systemFontOfSize:16] tailColor:UIColor.blackColor];
        [self.areaLabel setRangeOfString:@" " lineSpacing:0 firstFont:[UIFont systemFontOfSize:16] firstColor:UIColor.grayColor tailFont:[UIFont systemFontOfSize:16] tailColor:UIColor.blackColor];
        
        for (int i = 0; i <  self.lists.count; i++) {
            [self.btns[i] setTitle:self.lists[i] forState:UIControlStateNormal];
            self.btns[i].titleLabel.font =  [UIFont systemFontOfSize:19 weight:UIFontWeightBold];
        }

        
    }else {
            
        self.numLabel.text = @"陈主任\n983726";
        [self.numLabel setRangeOfString:@"\n" lineSpacing:8 firstFont:[UIFont systemFontOfSize:18 weight:UIFontWeightBold] firstColor:UIColor.blackColor tailFont:[UIFont systemFontOfSize:16] tailColor:UIColor.grayColor];

         //NSArray *lits = @[@"訂單列表",@"本日派送記錄報告",@"倉存記錄",@"檢查已入倉單"];
         for (int i = 0; i < self.lists.count; i++) {
             [self.btns[i] setTitle:self.lists[i] forState:UIControlStateNormal];
             self.btns[i].titleLabel.font =  [UIFont systemFontOfSize:19 weight:UIFontWeightBold];
         }

    }
   
    
    
}

// 按钮事件
- (void)btnClick:(UIButton *)sender {
//     if ([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual: RoleTypeDriver]) { //司机
//             _lists = [NSMutableArray arrayWithArray: @[@"送貨單",@"本日派送記錄報告"]];
//          }else if([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual: RoleTypeStorekeeper]) { // 入仓员
//             _lists = [NSMutableArray arrayWithArray: @[@"掃描入倉",@"倉存記錄",@"檢查已入倉單",@"新來貨單到達時間"]];
//          }else if([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual:RoleTypeCustomerService]) { // 客服
//             _lists = [NSMutableArray arrayWithArray: @[@"客戶列表"]];
//          }else { // 管理员
//             _lists = [NSMutableArray arrayWithArray: @[@"訂單列表",@"本日派送記錄報告",@"倉存記錄",@"檢查已入倉單"]];
//          }
    
    NSLog(@"---%@", sender.titleLabel.text);
    
    
    if([sender.titleLabel.text isEqualToString:@"檢查已入倉單"]) {
          if ([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual: RoleTypeStorekeeper]) {
              QCSAreaVC *area = [[QCSAreaVC alloc] init];
              [self.navigationController pushViewController:area animated:YES];
          }else {
             QCSWarehouseVC * warehouse = [[QCSWarehouseVC alloc] init];
             [self.navigationController  pushViewController:warehouse animated:YES];
          }
    }else if ([sender.titleLabel.text isEqualToString:@"倉存記錄"]) {
            QCSWarehouseRecordVC * wr = [[QCSWarehouseRecordVC alloc] init];
            [self.navigationController pushViewController:wr animated:YES];
        
    }else if ([sender.titleLabel.text isEqualToString:@"本日派送記錄報告"]) {
        QCSDeliveryReportVC *dr = [[QCSDeliveryReportVC alloc] init];
        [self.navigationController pushViewController:dr animated:YES];
    
    }else if([sender.titleLabel.text isEqualToString:@"訂單列表"]){
        QCSOrderMainVC *main = [[QCSOrderMainVC alloc] init];
        [self.navigationController pushViewController:main animated:YES];
        
        // if([sender.titleLabel.text isEqualToString:@"新來到貨單到達時間"])
    }else if([sender.titleLabel.text isEqualToString:@"新來貨單到達時間"]) {
        QCSNewBillVC *bill = [[QCSNewBillVC alloc] init];
        [self.navigationController pushViewController:bill animated:YES];
        
    }else if([sender.titleLabel.text isEqualToString:@"掃描入倉"]) {
        QCSWarehousingVC *ware = [[QCSWarehousingVC alloc] init];
        [self.navigationController pushViewController:ware animated:YES];
    }
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
