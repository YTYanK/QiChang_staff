//
//  ProductListView.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/27.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "ProductListView.h"
#import "ProductCell.h"


@interface ProductListView()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView * tableView;

@end


@implementation ProductListView


- (instancetype)initWithFrame:(CGRect)frame
{
    NSLog(@"???--%s",__func__);
    // 固定设置高度
    self = [super initWithFrame:frame];
    if (self) {
        [self initAllView];
    }
    return self;
}


- (void)initAllView {
   
    UIImageView * icon = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:icon];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self addSubview:self.tableView];
    
      [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self).with.offset(0);
         make.left.equalTo(self).with.offset(0);
         make.height.mas_equalTo(40 * 3);
         make.width.equalTo(self);
     }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}// numberOfRowsInSection:(NSInteger)section

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ProductCell *cell = [ProductCell initCellWithCellView:tableView reuseIdentifier:@"ProductCell"];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
