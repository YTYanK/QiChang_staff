//
//  QCSDeliveryDetailsVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/14.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "QCSDeliveryDetailsVC.h"

#import "QCSCardView.h"

@interface QCSDeliveryDetailsVC ()
@property (strong, nonatomic) QCSCardView *cardView;
@property int index;
@end

@implementation QCSDeliveryDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAllInitSubView];
    [self updateAllData];
}
#pragma mark - 初始化设置
- (void)setAllInitSubView {
    self.title = @"報告詳情";
    self.view.backgroundColor =  NAV_COLOR;
    
    
    NSArray * textAry = @[@"日期:",@"師傅:",@"本日已派送(單):",@"本日已成功審核(單):",@"本日未派送(單):"];
    
    self.cardView = [[QCSCardView alloc] initWithFrame:CGRectMake(0, SCREEN_NAV_BAR, SCREEN_WIDTH, 300)];
    self.cardView.viewBlock = ^(UIView * _Nonnull view) {
    
        for (int i = 0; i < textAry.count; i++) {
            
            CGFloat y = (i * 30) + (i * 15) + 16;
            UILabel * text = [[UILabel alloc] initWithFrame:CGRectZero];
            text.font = [UIFont systemFontOfSize:14];
            text.text = [NSString stringWithFormat:@"%@",textAry[i]];
            [view addSubview:text];

            [text mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(view).with.offset(y);
                make.left.equalTo(view).with.offset(20);
                make.height.mas_equalTo(30);
                make.width.equalTo(view).with.multipliedBy(0.8);
            }];
            
        }
    };
    [self.view addSubview:self.cardView];
    
    
    self.isCustomTable = YES;
  
    if (IS_IPHONE_X) {
      self.baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_NAV_BAR +self.cardView.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - SCREEN_NAV_BAR - 26)];
    }else {
      self.baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_NAV_BAR +self.cardView.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - SCREEN_NAV_BAR - 300)];
    }
    
    // 需要创建对象之后使用
    self.baseTableView.backgroundColor = YTYRGBA(242, 242, 242, 1);
    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationItem.leftBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(backClick) image:[[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    [self.view addSubview:self.baseTableView];
    
    
       __weak __typeof(self)weakSelf = self;
       CGFloat leftW =  SCREEN_WIDTH * 0.2;
        CGFloat avew =   (SCREEN_WIDTH * 0.8)/3;
        self.additionalBlock = ^(UITableViewCell * _Nonnull cell) {
            weakSelf.index++;
        
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
              l1.font = [UIFont systemFontOfSize:13];
              UILabel *l2 = [[UILabel alloc] initWithFrame:CGRectZero];
              l2.textAlignment = NSTextAlignmentCenter;
              l2.textColor = UIColor.blackColor;
              l2.font = [UIFont systemFontOfSize:13 ];
              
              UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectZero];
            
              [subView addSubview:l0];
              [subView addSubview:l1];
              [subView addSubview:l2];
              [subView addSubview:icon];
              [subView addSubview:line];
             
              l0.text = [NSString stringWithFormat:@"%d",weakSelf.index];
              l1.text = @"2319821";
              l2.text = @"1/10/2019 15:30";
            if(weakSelf.index == 0) {
              icon.image = [UIImage imageNamed:@"no"];
            }else {
                icon.image = [UIImage imageNamed:@"ok"];
            }
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
                  make.width.mas_equalTo(avew);
              }];
              [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.top.equalTo(subView).with.offset(0);
                 make.left.equalTo(l1.mas_right).with.offset(0);
                 make.height.equalTo(subView.mas_height);
                 make.width.mas_equalTo(avew);
              }];
              [icon mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.centerY.equalTo(subView).with.offset(0);
                 make.left.equalTo(l2.mas_right).with.offset(avew/2 - 10);
                 make.height.mas_equalTo(20);
                 make.width.mas_equalTo(20);
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
        };
        
    
    
    

 
}
- (void)updateAllData {
   // 更新头部
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
//    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, 2);
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
    UILabel *l3 = [[UILabel alloc] initWithFrame:CGRectZero];
    l3.textAlignment = NSTextAlignmentCenter;
    l3.textColor = UIColor.whiteColor;
    l3.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    [subV addSubview:l1];
    [subV addSubview:l2];
    [subV addSubview:l3];
    
    l1.text = @"訂單編號";
    l2.text = @"派送時間";
    l3.text = @"審核";
   
    CGFloat leftW =  SCREEN_WIDTH * 0.2;
    CGFloat avew =   (SCREEN_WIDTH * 0.8)/3;
    [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(subV).with.offset(0);
        make.left.equalTo(subV).with.offset(leftW);
        make.height.equalTo(subV.mas_height);
        make.width.mas_equalTo(avew);
    }];
    [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(subV).with.offset(0);
       make.left.equalTo(l1.mas_right).with.offset(0);
       make.height.equalTo(subV.mas_height);
       make.width.mas_equalTo(avew);
    }];
    [l3 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(subV).with.offset(0);
       make.left.equalTo(l2.mas_right).with.offset(0);
       make.height.equalTo(subV.mas_height);
       make.width.mas_equalTo(avew);
    }];
    
    return  subV;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    DeliveryReportCell *cell = [DeliveryReportCell initCellWithCellView:tableView reuseIdentifier:@"DeliveryReportCell"];
//    cell.nestingTableView = tableView;
//    
//    cell.icon.image = [UIImage imageNamed:@"logo"];
//    cell.icon.backgroundColor = UIColor.redColor;
//    cell.number.text = @"員工編號 382846583";
//    cell.name.text = @"名稱\n陳大文";
//    [cell.name setRangeOfString:@"\n" lineSpacing:6 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:13] tailColor:UIColor.blackColor];
//
//    return  cell;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    QCSWarehuseRecordDetailsVC * details = [[QCSWarehuseRecordDetailsVC alloc] init];
//    [self.navigationController  pushViewController:details animated:YES];
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

@end
