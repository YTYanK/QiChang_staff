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

@end

@implementation QCSOrderDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAllInitSubView];
    [self updateAllData];
}
#pragma mark - 初始化设置
- (void)setAllInitSubView {
    
    self.view.backgroundColor = NAV_COLOR;
    self.navigationItem.leftBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(backClick) image:[[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    
    
    self.dataLabel = [[YTYLabel alloc] initWithFrame:CGRectZero];
    self.dataLabel.backgroundColor = UIColor.redColor;
    [self.view addSubview:self.dataLabel];
    self.numberLabel = [[YTYLabel alloc] initWithFrame:CGRectZero];
    self.numberLabel.backgroundColor = UIColor.greenColor;
    [self.view addSubview:self.numberLabel];
    
    
    [self.dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(SCREEN_NAV_BAR);
        make.left.equalTo(self.view).with.offset(0);
        make.width.equalTo(self.view).with.multipliedBy(1);
        make.height.mas_equalTo(44);
    }];
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.dataLabel.mas_bottom).with.offset(0);
           make.left.equalTo(self.view).with.offset(0);
           make.width.equalTo(self.view).with.multipliedBy(1);
           make.height.mas_equalTo(44);
       }];
    

    NSArray * textAry = @[@"派送日期 2019/11/27", @"派送地區 港島",@"聯絡人電話 1928389210",@"派送地點 LADIES RECREATION AND CLUB 10 OLD PEAK       ROAD, HONG KO"];
    
    self.cardView = [[QCSCardView alloc] initWithFrame:CGRectMake(0, SCREEN_NAV_BAR + 88, SCREEN_WIDTH, 300)];
    self.cardView.viewBlock = ^(UIView * _Nonnull view) {
       
           for (int i = 0; i < textAry.count; i++) {
               
               CGFloat y = (i * 30) + (i * 15) + 16;
               UILabel * text = [[UILabel alloc] initWithFrame:CGRectZero];
               text.font = [UIFont systemFontOfSize:14];
               text.text = [NSString stringWithFormat:@"%@",textAry[i]];
               text.numberOfLines = 3;
               [view addSubview:text];

               [text mas_makeConstraints:^(MASConstraintMaker *make) {
                   make.top.equalTo(view).with.offset(y);
                   make.left.equalTo(view).with.offset(20);
                   if (i == (textAry.count - 1)) {
                     make.height.mas_equalTo(50);
                   }else {
                    make.height.mas_equalTo(30);
                   }
                  
                   make.width.equalTo(view).with.multipliedBy(0.8);
               }];
               
           }
       };
       [self.view addSubview:self.cardView];
    
    
    
//    self.baseTableView = [[UITableView alloc] initWithFrame:CGRectZero];
//    // 需要创建对象之后使用
//    self.baseTableView.backgroundColor = YTYRGBA(242, 242, 242, 1);
//    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
- (void)updateAllData {
    self.title = @"訂單詳情"; //标题
    self.dataLabel.text = @"訂單資料";
    self.numberLabel.text = @"訂單編號 382846583";
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

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return  0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, 2);
    return  nil;//[HeaderVIew obtainGradientLayerViewFrame:frame viewFrame:frame];
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    WarehouseCell *cell = [WarehouseCell initCellWithCellView:tableView reuseIdentifier:@"WarehouseCell"];
//    cell.nestingTableView = tableView;
//
////    cell.numLabel.text = @"產品編號\nR77368";
////    cell.nameLabel.text = @"產品名稱\n 32oz DPE White Paper Cup";
////    cell.priceLabel.text = @"$1000 /包";
////    cell.priceLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightBold];
////    cell.icon.image =  [UIImage imageNamed:@"paper"];
////    [cell.numLabel  setRangeOfString:@"\n" lineSpacing:5 firstFont:setArialFont(12) tailFont:[UIFont systemFontOfSize:12] ];
////     [cell.nameLabel  setRangeOfString:@"\n" lineSpacing:5 firstFont:setArialFont(12) tailFont:[UIFont systemFontOfSize:12]];
//    return  cell;
//
//}

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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
