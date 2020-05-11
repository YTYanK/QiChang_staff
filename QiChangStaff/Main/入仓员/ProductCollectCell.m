//
//  ProductCollectCell.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/5/6.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "ProductCollectCell.h"

@interface ProductCollectCell() {
    int num;
}

@property (strong, nonatomic) NSMutableArray<UIButton *> * btns;

@property (strong, nonatomic) UIView *container;



//

//@property (strong, nonatomic) ProductView * productView;

@end

@implementation ProductCollectCell

- (void)setBtnTitles:(NSArray *)btnTitles {
    if (_btnTitles == nil) {
        _btnTitles = btnTitles;

        for (int b = 0; b < _btnTitles.count; b++) {
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectZero];
            btn.tag = b;
            [btn setTitleColor:UIColor.whiteColor  forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            if (b == 0) {
                 btn.selected  = true;
                 btn.backgroundColor = YTYRGB(246, 179, 127);
            }else {
                 btn.selected  = false;
                 btn.backgroundColor = YTYRGB(0, 146, 63);
            }


            [btn setTitle:_btnTitles[b] forState:UIControlStateNormal];
            [btn  addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:btn];
            [self.btns addObject:btn];

               [self.btns[b] mas_makeConstraints:^(MASConstraintMaker *make) {
                   make.top.equalTo(self.state.mas_bottom).offset(10);
                  if (b == 0) {
                        make.leading.equalTo(self.contentView.mas_leading).offset(10);
                   }else {
                        make.leading.equalTo(self.btns[b - 1].mas_trailing).offset(10);
                  }
                   make.width.equalTo(self.contentView).multipliedBy(0.2);
                   make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
               }];

        }
    }
}

- (void)setDataLits:(NSMutableArray<NSDictionary *> *)dataLits{
    if (_dataLits == nil) {
        _dataLits = dataLits;
        
        
        for (int i = 0; i < _dataLits.count; i++) {
              ProductView *pvs = [[ProductView alloc] initWithFrame:CGRectZero];
              //pvs.backgroundColor = UIColor.greenColor;
              [pvs updateDataForDictionrary:_dataLits[i]];
              [self.container addSubview:pvs];
              [self.productViews addObject:pvs];
            
            
              [self.productViews[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                            if (i == 0) {
                              make.top.equalTo(self.container.mas_top).offset(0);
                            }else {
                              make.top.equalTo(self.productViews[i- 1].mas_bottom).offset(2);
                            }
                            if (i == (_dataLits.count - 1)) {
                              make.bottom.equalTo(self.container.mas_bottom).offset(0);
                            }
                            make.left.equalTo(self.container).offset(0);
                            make.right.equalTo(self.container).offset(0);

                     }];
          }
        
        
//        for (int j = 0; j < _dataLits.count; j++) {
//               [self.productViews[j] mas_makeConstraints:^(MASConstraintMaker *make) {
//                       if (j == 0) {
//                         make.top.equalTo(self.container.mas_top).offset(0);
//                       }else {
//                         make.top.equalTo(self.productViews[j - 1].mas_bottom).offset(2);
//                       }
//                       if (j == (_dataLits.count - 2)) {
//                        make.bottom.equalTo(self.container.mas_bottom).offset(0);
//                       }
//                       make.left.equalTo(self.container).offset(0);
//                       make.right.equalTo(self.container).offset(0);
//
//                }];
//         }
        
//        //容器
//               [self.container mas_remakeConstraints:^(MASConstraintMaker *make) {
//                   make.top.equalTo(self.product.mas_bottom).offset(15);
//                   make.leading.equalTo(self.contentView.mas_leading).offset(10.0);
//                   //小于或等于 lessThanOrEqualTo
//                   make.trailing.equalTo(self.contentView.mas_trailing).offset(-10.0);
//           //        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10.0);
//               }];

       
        
    }
}


- (void)layoutAllSubviews {
    
          [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.leading.equalTo(self.contentView.mas_leading).offset(10);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(15);
            make.left.equalTo(self.icon.mas_right).offset(20);
            make.right.equalTo(self.contentView).offset(-20);
        }];
        
    
    
    [self.product mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
        make.left.equalTo(self.contentView).offset(10);
        make.width.equalTo(self.contentView).multipliedBy(0.4);

    }];
    
    
    [self.num mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
        make.leading.equalTo(self.product.mas_trailing).offset(10);
        make.width.equalTo(self.contentView).multipliedBy(0.2);
    }];
    
    [self.actualNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
        make.leading.equalTo(self.num.mas_trailing).offset(5);
        make.width.equalTo(self.contentView).multipliedBy(0.3);
    }];
    
        
    //容器
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.product.mas_bottom).offset(15);
        make.leading.equalTo(self.contentView.mas_leading).offset(10.0);
        //小于或等于 lessThanOrEqualTo
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-10.0);
    //        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10.0);
    }];

        
        
     // 確定按鈕
        [self.complete mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.container.mas_bottom).offset(10);
                make.leading.equalTo(self.contentView.mas_leading).offset(10.0);
                //小于或等于 lessThanOrEqualTo
                make.trailing.equalTo(self.contentView.mas_trailing).offset(-10.0);
               // make.bottom.equalTo(self.contentView.mas_bottom).offset(-10.0);
        }];
        
        [self.area mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.top.equalTo(self.complete.mas_bottom).offset(10);
                 make.leading.equalTo(self.contentView.mas_leading).offset(10.0);
                 //小于或等于 lessThanOrEqualTo
                 make.width.equalTo(self.contentView).multipliedBy(0.4);
         }];
        
        [self.state mas_makeConstraints:^(MASConstraintMaker *make) {
    //         make.centerY.equalTo(self.area).offset(0);
             make.top.equalTo(self.complete.mas_bottom).offset(10);
             make.leading.equalTo(self.area.mas_trailing).offset(10.0);
             make.width.equalTo(self.contentView).multipliedBy(0.4);
           //  make.bottom.equalTo(self.contentView.mas_bottom).offset(-10.0);
        }];
        
        
//         for (int j = 0; j < self.dataLits.count; j++) {
//               [self.productViews[j] mas_makeConstraints:^(MASConstraintMaker *make) {
//                       if (j == 0) {
//                         make.top.equalTo(self.container.mas_top).offset(0);
//                       }else {
//                         make.top.equalTo(self.productViews[j - 1].mas_bottom).offset(2);
//                       }
//                       if (j == (self.dataLits.count - 2)) {
//                        make.bottom.equalTo(self.container.mas_bottom).offset(0);
//                       }
//                       make.left.equalTo(self.container).offset(0);
//                       make.right.equalTo(self.container).offset(0);
//
//                }];
//         }
        
      
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    // 初始化
    self.btns = [NSMutableArray array];
    self.productViews =[NSMutableArray array];
    num =3;
    [self initAllView];
    [self layoutAllSubviews];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initAllView];
        [self layoutAllSubviews];
    }
    return self;
}


- (void)initAllView {
    self.icon = [[UIImageView alloc] init];
    self.icon.image = [UIImage imageNamed:@"产品"];
    [self.contentView addSubview:self.icon];
    
    
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = UIColor.blackColor;
    self.titleLabel.numberOfLines = 0;
    [self.contentView addSubview:self.titleLabel];

    self.container = [[UIView alloc] init];
    [self.contentView addSubview:self.container];
    


    self.product = [[UILabel alloc] init];
   
    self.product.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    self.num = [[UILabel alloc] init];

    self.num.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    self.actualNum = [[UILabel alloc] init];
    self.actualNum.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    
    self.product.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.product];
    [self.contentView addSubview:self.num];
    [self.contentView addSubview:self.actualNum];
    
    
    
    
//    for (int i = 0; i < self.dataLits.count; i++) {
//        ProductView *pvs = [[ProductView alloc] initWithFrame:CGRectZero];
//        //pvs.backgroundColor = UIColor.greenColor;
//        [pvs updateDataForDictionrary:self.dataLits[i]];
//        [self.container addSubview:pvs];
//        [self.productViews addObject:pvs];
//    }
    
    self.complete = [[UIButton alloc] init];
    [self.complete setTitle:@"完成" forState:UIControlStateNormal];
    self.complete.backgroundColor = NAV_COLOR;
    [self.complete setViewBorderCornerRadius:3 borderWidth:0 borderColor:UIColor.clearColor];
    [self.contentView addSubview:self.complete];
    
    
    self.area = [[UILabel alloc] init];
    self.area.numberOfLines = 2;
    self.state = [[UILabel alloc] init];
    self.state.numberOfLines = 2;
    [self.contentView addSubview:self.area];
    [self.contentView addSubview:self.state];
    

    
      
}




- (void)btnClick:(UIButton *)sender {
    
    
    for (int i = 0; i < self.btns.count; i++) {
        if (sender.tag == i) {
            self.btns[i].selected = true;
            self.btns[i].backgroundColor = YTYRGB(246, 179, 127);
        }else {
            self.btns[i].selected = false;
            self.btns[i].backgroundColor = YTYRGB(0, 146, 63);
        }
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
