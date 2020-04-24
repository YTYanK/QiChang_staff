//
//  QCSNewBillVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/24.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "QCSNewBillVC.h"
#import "YTYSearchView.h"

@interface QCSNewBillVC ()

@property (nonatomic, strong) YTYSearchView * searchView;
@end

@implementation QCSNewBillVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAllInitSubView];
    [self updateAllData];
}
#pragma mark - 初始化设置
- (void)setAllInitSubView {
    self.title = @"新來到貨單到達時間";
    self.view.backgroundColor = NAV_COLOR;

    
    // 搜索头部
    self.searchView = [[YTYSearchView alloc] initWithFrame:CGRectMake(0, SCREEN_NAV_BAR, SCREEN_WIDTH, 50)];
    [self.view addSubview:self.searchView];
    
    
    self.isCustomTable = YES;
    if (IS_IPHONE_X) {
       self.baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_NAV_BAR +self.searchView.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - SCREEN_NAV_BAR - 26)];
     }else {
       self.baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_NAV_BAR +self.searchView.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - SCREEN_NAV_BAR - self.searchView.size.height)];
     }
    // 需要创建对象之后使用
    self.baseTableView.backgroundColor = YTYRGBA(242, 242, 242, 1);
    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationItem.leftBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(backClick) image:[[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    [self.view addSubview:self.baseTableView];

    __weak __typeof(self)weakSelf = self;
    self.additionalBlock = ^(UITableViewCell * _Nonnull cell, NSIndexPath * _Nonnull indexPath) {
    
        UIView *subView = [[UIView alloc] initWithFrame:CGRectZero];
        subView.backgroundColor = UIColor.whiteColor;  //YTYRGBA(62, 146, 198, 1);
          
        UIView *line = [[UIView alloc] initWithFrame:CGRectZero];
        line.backgroundColor = YTYRGBA(220, 220, 220, 1);
        
        
          UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectZero];
          l1.textAlignment = NSTextAlignmentCenter;
          l1.textColor = UIColor.blackColor;
          l1.font = [UIFont systemFontOfSize:13];
          UILabel *l2 = [[UILabel alloc] initWithFrame:CGRectZero];
          l2.textAlignment = NSTextAlignmentCenter;
          l2.textColor = UIColor.blackColor;
          l2.font = [UIFont systemFontOfSize:13 ];
          UILabel *l3 = [[UILabel alloc] initWithFrame:CGRectZero];
          l3.textAlignment = NSTextAlignmentCenter;
          l3.textColor = UIColor.blackColor;
          l3.font = [UIFont systemFontOfSize:13];
          [subView addSubview:l1];
          [subView addSubview:l2];
          [subView addSubview:l3];
          [subView addSubview:line];
         
          l1.text = @"2319821";
          l2.text = @"1/10/2019 15:30";
          l3.text = @"3/12/2019 13:32";
          
          
          [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
              make.top.equalTo(subView).with.offset(0);
              make.left.equalTo(subView).with.offset(0);
              make.height.equalTo(subView.mas_height);
              make.width.equalTo(subView).with.multipliedBy(0.3);
          }];
          [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.equalTo(subView).with.offset(0);
             make.left.equalTo(l1.mas_right).with.offset(0);
             make.height.equalTo(subView.mas_height);
             make.width.equalTo(subView).with.multipliedBy(0.4);
          }];
          [l3 mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.equalTo(subView).with.offset(0);
             make.left.equalTo(l2.mas_right).with.offset(0);
             make.height.equalTo(subView.mas_height);
             make.width.equalTo(subView).with.multipliedBy(0.3);
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
        
        
//        cell.textLabel.text = [NSString stringWithFormat:@"--%d",weakSelf.index];
    };
    
}
- (void)updateAllData {
   // 更新头部
}



#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // 入仓员
    if ([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual: RoleTypeStorekeeper]) {
      return 2;
    }else {
      return 1;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 20;
    }else {
        return 100;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
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

    [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(subV).with.offset(0);
        make.left.equalTo(subV).with.offset(0);
        make.height.equalTo(subV.mas_height);
        make.width.equalTo(subV).with.multipliedBy(0.3);
    }];
    [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(subV).with.offset(0);
       make.left.equalTo(l1.mas_right).with.offset(0);
       make.height.equalTo(subV.mas_height);
       make.width.equalTo(subV).with.multipliedBy(0.4);
    }];
    [l3 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(subV).with.offset(0);
       make.left.equalTo(l2.mas_right).with.offset(0);
       make.height.equalTo(subV.mas_height);
       make.width.equalTo(subV).with.multipliedBy(0.3);
    }];
    

    
     // 入仓员
     if ([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual: RoleTypeStorekeeper]) {
         if (section == 0) {
             l1.text = @"入倉單編號";
             l2.text = @"來貨日期";
             l3.text = @"處理日期";
         }else {
            l1.text = @"欠入倉單編號";
            l2.text = @"來貨日期";
            l3.text = @"處理日期";
         }
     }else {
          l1.text = @"入倉單編號";
          l2.text = @"來貨日期";
          l3.text = @"處理日期";
     }
    
    return  subV;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual: RoleTypeAdminis]) {
       QCSWarehuseRecordDetailsVC * details = [[QCSWarehuseRecordDetailsVC alloc] init];
         [self.navigationController  pushViewController:details animated:YES];
    }
    
   
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
