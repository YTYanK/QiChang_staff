//
//  ProductCollectCell.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/5/6.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "ProductCollectCell.h"
#import "ProductCell.h"

@interface ProductCollectCell()

@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UIButton *complete;

@property (strong, nonatomic) UILabel *state;

@property (strong, nonatomic) UILabel *area;

@property (strong, nonatomic) NSMutableArray<UIButton *> * btns;

@property (strong, nonatomic) ProductCell *cell;

@end

@implementation ProductCollectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self initAllView];
}
//
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self initAllView];
//    }
//    return self;
//}


- (void)initAllView {
    self.icon = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:self.icon];
    
    self.icon.image = [UIImage imageNamed:@"产品"];
    
    self.title = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:_title];
    self.title.backgroundColor = UIColor.grayColor;
    self.title.numberOfLines = 0;
    self.title.text = @"美國 'Solo' \"BARE\" 四安蒸餾水捲邊尖杯(Eco- Forward) Packing: 1 x 25boxes x";
    
    
    self.cell = [[NSBundle mainBundle] loadNibNamed:@"ProductCell" owner:nil options:nil][0];
//    UIView *productView  = self.cell;
    self.cell.backgroundColor = UIColor.redColor;
    self.cell.contentView.backgroundColor = UIColor.greenColor;
     [self addSubview:self.cell];
    
    self.cell.product.text = @"index下1";
    
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.leading.equalTo(self.contentView.mas_leading).offset(10);
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
        make.leading.equalTo(self.icon.mas_trailing).offset(20);
        make.trailing.equalTo(self.mas_trailing).offset(-20);
    }];
    
//    UINib *nib=[UINib nibWithNibName:@"ProductCell" bundle:nil]; //[UINib nibWithNibName"MyCell" bundle:nil]; //得到创建的cell 的xib

    
    [self.cell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom).offset(10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.leading.equalTo(self.mas_leading).offset(0);
        make.trailing.equalTo(self.mas_trailing).offset(0);
    }];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
