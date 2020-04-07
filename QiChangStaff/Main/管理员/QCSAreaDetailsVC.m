//
//  QCSAreaDetailsVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/7.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "QCSAreaDetailsVC.h"
#import "AreaDetailsCell.h"


@interface QCSAreaDetailsVC ()

@end

@implementation QCSAreaDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAllInitSubView];
    [self updateAllData];
}
#pragma mark - 初始化设置
- (void)setAllInitSubView {
    self.title = @"區域詳情";
    self.view.backgroundColor = YTYRGBA(242, 242, 242, 1);
    self.baseTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    // 需要创建对象之后使用
    self.baseTableView.backgroundColor = YTYRGBA(242, 242, 242, 1);
    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationItem.leftBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(backClick) image:[[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
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
    return 170;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView * v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    v.backgroundColor = UIColor.redColor;
    return v;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AreaDetailsCell *cell = [AreaDetailsCell initCellWithCellView:tableView reuseIdentifier:@"AreaDetailsCell"];
    cell.nestingTableView = tableView;
    
//    cell.numLabel.text = @"產品編號\nR77368";
//    cell.nameLabel.text = @"產品名稱\n 32oz DPE White Paper Cup";
//    cell.priceLabel.text = @"$1000 /包";
//    cell.priceLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightBold];
//    cell.icon.image =  [UIImage imageNamed:@"paper"];
//    [cell.numLabel  setRangeOfString:@"\n" lineSpacing:5 firstFont:setArialFont(12) tailFont:[UIFont systemFontOfSize:12] ];
//     [cell.nameLabel  setRangeOfString:@"\n" lineSpacing:5 firstFont:setArialFont(12) tailFont:[UIFont systemFontOfSize:12]];
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
