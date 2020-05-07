//
//  ProductCollectCell.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/5/6.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "ProductCollectCell.h"

@interface ProductCollectCell()




//

//@property (strong, nonatomic) ProductView * productView;

@end

@implementation ProductCollectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self initAllView];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initAllView];
    }
    return self;
}


- (void)initAllView {
    self.icon = [[UIImageView alloc] init];
    self.icon.image = [UIImage imageNamed:@"产品"];
    [self.contentView addSubview:self.icon];
    
    
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = UIColor.blackColor;
    self.titleLabel.backgroundColor = UIColor.grayColor;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.text =@"嘻嘻笑嘻嘻？";
    [self.contentView addSubview:self.titleLabel];

    UIView *view = [[UIView alloc] init];
    view.backgroundColor = UIColor.blueColor;
    [self.contentView addSubview:view];
    

    self.productViews =[NSMutableArray array];
    int num = 3;
    for (int i = 0; i < num; i++) {
        ProductView *pvs = [[ProductView alloc] initWithFrame:CGRectZero];
        pvs.backgroundColor = UIColor.greenColor;
        [view addSubview:pvs];
        [self.productViews addObject:pvs];
    }
    

    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.leading.equalTo(self.contentView.mas_leading).offset(10);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.icon.mas_right).offset(20);
        make.right.equalTo(self.contentView).offset(-20);
    }];
    
    
  //容器
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.leading.equalTo(self.contentView.mas_leading).offset(10.0);
        //小于或等于 lessThanOrEqualTo
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-10.0);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10.0);
    }];
    
    
    
    for (int j = 0; j < num; j++) {
        [self.productViews[j] mas_makeConstraints:^(MASConstraintMaker *make) {
                if (j == 0) {
                  make.top.equalTo(view.mas_top).offset(0);
                }else {
                  make.top.equalTo(self.productViews[j - 1].mas_bottom).offset(2);
                }
                if (j == (num - 1)) {
                  make.bottom.equalTo(view.mas_bottom).offset(0);
                }
                make.left.equalTo(view).offset(0);
                make.right.equalTo(view).offset(0);

         }];
    }

    
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
