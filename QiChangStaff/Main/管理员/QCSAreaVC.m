//
//  QCSAreaVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/3.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "QCSAreaVC.h"
#import "AreaCell.h"

@interface QCSAreaVC ()

@end

@implementation QCSAreaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAllInitSubView];
    [self updateAllData];
}
#pragma mark - 初始化设置
- (void)setAllInitSubView {
    self.view.backgroundColor = YTYRGBA(242, 242, 242, 1);
    self.baseTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    // 需要创建对象之后使用
    self.baseTableView.backgroundColor = YTYRGBA(242, 242, 242, 1);
    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//       self.navigationItem.leftBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(backClick:)];
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AreaCell *cell = [AreaCell initCellWithCellView:tableView reuseIdentifier:@"AreaCell"];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
