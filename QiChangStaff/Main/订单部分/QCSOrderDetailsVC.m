//
//  QCSOrderDetailsVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/16.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "QCSOrderDetailsVC.h"
#import "QCSCardView.h"
#import "YTYLabel.h"

@interface QCSOrderDetailsVC ()
@property (strong, nonatomic)QCSCardView *cardView;
@property (strong, nonatomic)YTYLabel *dataLabel;
@property (strong, nonatomic)YTYLabel *numberLabel;
@property (strong, nonatomic)YTYLabel *stateLabel;
@property (strong, nonatomic)UIImageView * icon;
@property int index;


@property (strong, nonatomic)UIButton * auditBtn;

@end

@implementation QCSOrderDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAllInitSubView];
    [self updateAllData];
}

- (void)setState:(NSString *)state {
    if (_state != state) {
        _state = state;
         
    }
    
  
}

#pragma mark - 初始化设置
- (void)setAllInitSubView {
    
    self.view.backgroundColor = NAV_COLOR;
    self.navigationItem.leftBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(backClick) image:[[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    
    
    self.icon = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.icon.image = [UIImage imageNamed:@"Hook"];
    [self.view addSubview:self.icon];
    
    
    self.stateLabel = [[YTYLabel alloc] initWithFrame:CGRectZero];
   
    [self.stateLabel setViewBorderCornerRadius:2 borderWidth:1 borderColor:UIColor.whiteColor];
    self.stateLabel.textColor = UIColor.whiteColor;
    self.stateLabel.textAlignment = NSTextAlignmentCenter;
    self.stateLabel.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:self.stateLabel];
    
    
    self.dataLabel = [[YTYLabel alloc] initWithFrame:CGRectZero];
    self.dataLabel.textColor  =YTYRGBA(131, 58, 113, 1);
    self.dataLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    [self.view addSubview:self.dataLabel];
    self.numberLabel = [[YTYLabel alloc] initWithFrame:CGRectZero];
     self.numberLabel.textColor  =  UIColor.whiteColor;
    
    [self.view addSubview:self.numberLabel];
    
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(SCREEN_NAV_BAR + 26);
        make.left.equalTo(self.view).with.offset(26);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
    }];
    
    [self.dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerY.equalTo(self.icon);
        make.left.equalTo(self.icon.mas_right).with.offset(10);
        make.width.equalTo(self.view).with.multipliedBy(0.5);
        make.height.mas_equalTo(35);
    }];
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.dataLabel.mas_bottom).with.offset(0);
           make.left.equalTo(self.icon).with.offset(0);
           make.height.mas_equalTo(35);
     }];
    
    [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(self.numberLabel).with.offset(-8);
         make.left.equalTo(self.numberLabel.mas_right).with.offset(10);
         make.width.mas_equalTo(38);
         make.height.mas_equalTo(18);
    }];
    

    NSArray * textAry = @[@"派送日期 2019/11/27", @"派送地區 港島",@"聯絡人電話 1928389210",@"派送地點 LADIES RECREATION AND CLUB 10 OLD PEAK       ROAD, HONG KONG. \n 香港山顶道10号"];
    //CGRectMake(0, SCREEN_NAV_BAR + 76, SCREEN_WIDTH, 250)
    self.cardView = [[QCSCardView alloc] initWithFrame:CGRectZero];
    self.cardView.viewBlock = ^(UIView * _Nonnull view) {
       
           for (int i = 0; i < textAry.count; i++) {
               
               CGFloat y = (i * 30) + (i * 2) + 16;
               UILabel * text = [[UILabel alloc] initWithFrame:CGRectZero];
               text.font = [UIFont systemFontOfSize:14];
               text.text = [NSString stringWithFormat:@"%@",textAry[i]];
               text.numberOfLines = 5;
               [view addSubview:text];

               [text mas_makeConstraints:^(MASConstraintMaker *make) {
                   make.top.equalTo(view).with.offset(y);
                   make.left.equalTo(view).with.offset(20);
                   if (i == (textAry.count - 1)) {
                     make.height.mas_equalTo(60);
                   }else {
                       make.height.mas_equalTo(30);
                   }
                  
                   make.width.equalTo(view).with.multipliedBy(0.8);
               }];
               
           }
       };
    [self.view addSubview:self.cardView];
    [self.cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.numberLabel.mas_bottom).with.offset(-10);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.mas_equalTo(240);
    }];
    
    self.isCustomTable = YES;
    self.baseTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    // 需要创建对象之后使用
    self.baseTableView.backgroundColor = YTYRGBA(242, 242, 242, 1);
    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.baseTableView];
    
       __weak __typeof(self)weakSelf = self;
       CGFloat leftW =  SCREEN_WIDTH * 0.2;
        CGFloat w =   (SCREEN_WIDTH * 0.8);
        self.additionalBlock = ^(UITableViewCell * _Nonnull cell) {
           
        
            UIView *subView = [[UIView alloc] initWithFrame:CGRectZero];
            subView.backgroundColor = UIColor.whiteColor;
              
            UIView *line = [[UIView alloc] initWithFrame:CGRectZero];
            line.backgroundColor = YTYRGBA(220, 220, 220, 1);
            
              UILabel *l0 = [[UILabel alloc] initWithFrame:CGRectZero];
              l0.textAlignment = NSTextAlignmentCenter;
              l0.textColor = UIColor.blackColor;
              l0.font = [UIFont systemFontOfSize:13];
            
              UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectZero];
              l1.textAlignment = NSTextAlignmentCenter;
              l1.textColor = UIColor.blackColor;
              l1.numberOfLines = 6;
              l1.font = [UIFont systemFontOfSize:13];
              UILabel *l2 = [[UILabel alloc] initWithFrame:CGRectZero];
              l2.textAlignment = NSTextAlignmentCenter;
              l2.textColor = UIColor.blackColor;
              l2.font = [UIFont systemFontOfSize:13];
              
    
              [subView addSubview:l0];
              [subView addSubview:l1];
              [subView addSubview:l2];
              [subView addSubview:line];
             
               
              l0.text = [NSString stringWithFormat:@"%d",weakSelf.index];
              l1.text = @"美國 'Solo' \"BARE\" 四安蒸餾水 捲邊尖杯(Eco-Forward)Packing:  1 x 25boxes x";
              l2.text = @"10件";
        
              [l0 mas_makeConstraints:^(MASConstraintMaker *make) {
                  make.top.equalTo(subView).with.offset(0);
                  make.left.equalTo(subView).with.offset(0);
                  make.height.equalTo(subView.mas_height);
                  make.width.mas_equalTo(leftW);
              }];
            
              [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
                  make.top.equalTo(subView).with.offset(0);
                  make.left.equalTo(l0.mas_right).with.offset(0);
                  make.height.equalTo(subView.mas_height);
                  make.width.mas_equalTo(w * 0.6);
              }];
              [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.top.equalTo(subView).with.offset(0);
                 make.left.equalTo(l1.mas_right).with.offset(0);
                 make.height.equalTo(subView.mas_height);
                 make.width.mas_equalTo(w * 0.4);
              }];
    
             
             [line mas_makeConstraints:^(MASConstraintMaker *make) {

                make.left.equalTo(subView).with.offset(0);
                make.bottom.equalTo(subView).with.offset(1);
                make.height.mas_equalTo(1);
                make.width.equalTo(subView).with.multipliedBy(1);
             }];
            
            [cell addSubview:subView];
            
            [subView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell).with.offset(0);
                make.left.equalTo(cell).with.offset(0);
                make.height.equalTo(cell);
                make.width.equalTo(cell);
            }];
            
            weakSelf.index++;
        };
    
    
    if ([self.state isEqualToString:@"已派送"]) {
            self.auditBtn = [[UIButton alloc] initWithFrame:CGRectZero];
            self.auditBtn.backgroundColor = NAV_COLOR;
            [self.auditBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [self.auditBtn addTarget:self action:@selector(auditClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:self.auditBtn];
            [self.auditBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                   make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
                   make.left.equalTo(self.view);
                   make.width.equalTo(self.view);
                if (IS_IPHONE_X) {
                    make.height.mas_equalTo(68);
                }else {
                     make.height.mas_equalTo(44);
                 }
                     
                   
            }];
       }
    
    if (IS_IPHONE_X) {
        [self.baseTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cardView.mas_bottom).with.offset(0);
            make.left.equalTo(self.view);
            make.width.equalTo(self.view);
            if ([self.state isEqualToString:@"已派送"]) {
                make.bottom.equalTo(self.auditBtn.mas_top).with.offset(0);
            }else {
                make.bottom.equalTo(self.view.mas_bottom).with.offset(24);
            }
            
        }];
    }else {
        [self.baseTableView mas_makeConstraints:^(MASConstraintMaker *make) {
              make.top.equalTo(self.cardView.mas_bottom).with.offset(0);
              make.left.equalTo(self.view);
              make.width.equalTo(self.view);
            
              if ([self.state isEqualToString:@"已派送"]) {
                         make.bottom.equalTo(self.auditBtn.mas_top);
                     }else {
                       make.bottom.equalTo(self.view.mas_bottom);
                     }
           
          }];
    }
    
    
    
    
}
- (void)updateAllData {
    self.title = @"訂單詳情"; //标题
    self.dataLabel.text = @"訂單資料";
    self.numberLabel.text = @"訂單編號 382846583";
    self.stateLabel.text = self.state;
    [self.auditBtn setTitle:@"審核" forState:UIControlStateNormal];
}



#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
     UIView *subV = [[UIView alloc] init];
     subV.backgroundColor = NAV_COLOR;
     
     UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectZero];
     l1.textAlignment = NSTextAlignmentCenter;
     l1.textColor = UIColor.whiteColor;
     l1.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    
     UILabel *l2 = [[UILabel alloc] initWithFrame:CGRectZero];
     l2.textAlignment = NSTextAlignmentCenter;
     l2.textColor = UIColor.whiteColor;
     l2.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
     [subV addSubview:l1];
     [subV addSubview:l2];
     
     l1.text = @"產品名稱";
     l2.text = @"數量";
    
     CGFloat leftW =  SCREEN_WIDTH * 0.2;
     CGFloat w =   SCREEN_WIDTH * 0.8;
     [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(subV).with.offset(0);
         make.left.equalTo(subV).with.offset(leftW);
         make.height.equalTo(subV.mas_height);
         make.width.mas_equalTo(w * 0.6);
     }];
     [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(subV).with.offset(0);
        make.left.equalTo(l1.mas_right).with.offset(0);
        make.height.equalTo(subV.mas_height);
        make.width.mas_equalTo(w * 0.4);
     }];
    
     
     return  subV;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    QCSAreaVC * area = [[QCSAreaVC alloc] init];
//    [self.navigationController  pushViewController:area animated:YES];
 }


#pragma mark - 加载刷新
// 刷新
- (void)tableRefreshData {
    [self tableRefreshDataWithPage:1];
}
- (void)tableLoadData {
    [self tableLoadDataWithPage:1];
}

// 刷新
- (void)tableRefreshDataWithPage:(int)page {
//    NSMutableDictionary * dic =[NSMutableDictionary dictionary];
//    [dic setObject:isLogin forKey:@"session_token"];

    [self.baseTableView.mj_header endRefreshing];
    [self.baseTableView reloadData];
}

// 加载
- (void)tableLoadDataWithPage:(int)page {
    [self.baseTableView.mj_footer endRefreshing];
}


- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)auditClick:(UIButton *)sender {
    NSLog(@"--->>%@",sender);
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"是否確認審核?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//         [self deleteMessageNotificationPath:indexPath];

        
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:action1];
    [alertController addAction:action2];
    
    //显示alertController
    [self presentViewController:alertController animated:YES completion:nil];
    
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
