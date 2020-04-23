//
//  QCSAreaDetailsVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/7.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "QCSAreaDetailsVC.h"
#import "AreaDetailsCell.h"

#import "YTYLabel.h"
#import "AreaHeadView.h"

@interface QCSAreaDetailsVC ()
@property (strong, nonatomic)AreaHeadView * headView;
@end

@implementation QCSAreaDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAllInitSubView];
    [self updateAllData];
}
#pragma mark - 初始化设置
- (void)setAllInitSubView {
    
    
    self.headView = [[AreaHeadView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.headView];
    
    
    self.title = @"區域詳情";
    self.isCustomTable = YES;
    self.view.backgroundColor = NAV_COLOR;
    self.baseTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    if (IS_IPHONE_X) {
         self.baseTableView.frame = CGRectMake(0, SCREEN_NAV_BAR + 140, SCREEN_WIDTH,  SCREEN_HEIGHT - SCREEN_NAV_BAR - 140);
       }else {
         self.baseTableView.frame = CGRectMake(0, SCREEN_NAV_BAR + 140, SCREEN_WIDTH,  SCREEN_HEIGHT - SCREEN_NAV_BAR - 140);
       }
    // 需要创建对象之后使用
    self.baseTableView.backgroundColor = YTYRGBA(242, 242, 242, 1);
    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationItem.leftBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(backClick) image:[[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
   
    [self.view addSubview:self.baseTableView];
    
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.centerX.equalTo(self.view);
      make.top.equalTo(self.view).with.offset(SCREEN_NAV_BAR);
      make.height.mas_equalTo(140);
      make.width.equalTo(self.view.mas_width);
    }];
    
    self.additionalBlock = ^(UITableViewCell * _Nonnull cell, NSIndexPath * _Nonnull indexPath) {
        AreaDetailsCell *newCell = (AreaDetailsCell *)cell;
        newCell.batch.text = @"採購單編號\nP20191011";
        [newCell.batch setRangeOfString:@"\n" lineSpacing:6 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:13] tailColor:UIColor.blackColor];
//
    };
    
    
}
- (void)updateAllData {
   // 更新头部
    
    NSMutableDictionary * mutDic = [NSMutableDictionary dictionary];
    [mutDic setObject:@"當前區域基本資料3" forKey:@"info"];
    [mutDic setObject:@"区域" forKey:@"icon"];
    [mutDic setObject:@"最後更新時間\n4/10/19 18:20" forKey:@"date"];
    [mutDic setObject:@"Area1" forKey:@"area"];
    [mutDic setObject:@"目前可用CBM\n300/300" forKey:@"cbm"];
    [mutDic setObject:@"所屬\n倉庫2" forKey:@"name"];
     
    if ([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual: RoleTypeStorekeeper]) {
        [mutDic setObject:@(YES) forKey:@"twoPlace"];
    }
    
    self.headView.dicValue = mutDic;
}



#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
   YTYLabel * label = [[YTYLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    label.text = @"區域內產品資料詳細";
    label.backgroundColor = YTYRGBA(55, 141, 202,1);
       label.textColor = UIColor.whiteColor;
       label.font = [UIFont systemFontOfSize:15];
       label.textInsets = UIEdgeInsetsMake(15, 18, 15.f, 0.f);
//    v.backgroundColor = UIColor.redColor;
    return label;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AreaDetailsCell *cell = [AreaDetailsCell initCellWithCellView:tableView reuseIdentifier:@"AreaDetailsCell"];
    cell.indexPath = indexPath;
    cell.nestingTableView = tableView;
    if ([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual: RoleTypeStorekeeper]) {
          self.additionalBlock(cell, indexPath);
    }
    return  cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    ProductDetailsVC * productVC = [[ProductDetailsVC alloc] init];
//    [self.navigationController  pushViewController:productVC animated:YES];
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

// 返回事件
- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
