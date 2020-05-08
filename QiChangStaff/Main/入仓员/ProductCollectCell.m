//
//  ProductCollectCell.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/5/6.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "ProductCollectCell.h"

@interface ProductCollectCell()

@property (strong, nonatomic) NSMutableArray<UIButton *> * btns;


//

//@property (strong, nonatomic) ProductView * productView;

@end

@implementation ProductCollectCell

//- (void)setBtnTitles:(NSArray *)btnTitles {
//    if (_btnTitles == nil) {
//
//        _btnTitles = btnTitles;
//
//    }
//}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    // 初始化
    self.btns = [NSMutableArray array];
    self.productViews =[NSMutableArray array];
    self.btnTitles = [NSArray array];
//    self.btnTitles = []
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
//    self.titleLabel.text =@"嘻嘻笑嘻嘻？";
    [self.contentView addSubview:self.titleLabel];

    UIView *view = [[UIView alloc] init];
    view.backgroundColor = UIColor.blueColor;
    [self.contentView addSubview:view];
    

   
    int num = 3;
    for (int i = 0; i < num; i++) {
        ProductView *pvs = [[ProductView alloc] initWithFrame:CGRectZero];
        pvs.backgroundColor = UIColor.greenColor;
        [view addSubview:pvs];
        [self.productViews addObject:pvs];
    }
    
    self.complete = [[UIButton alloc] init];
    [self.complete setTitle:@"完成" forState:UIControlStateNormal];
    self.complete.backgroundColor = UIColor.redColor;
    [self.contentView addSubview:self.complete];
    
    
    self.area = [[UILabel alloc] init];
    self.area.numberOfLines = 2;
   
    
    self.state = [[UILabel alloc] init];
    self.state.numberOfLines = 2;
     
    
    [self.contentView addSubview:self.area];
    [self.contentView addSubview:self.state];
    
    self.btnTitles = @[@"收貨",@"收不齊",@"壞貨",@"送錯"];
    
    for (int b = 0; b < self.btnTitles.count; b++) {
        NSLog(@"???==>%@",self.btnTitles[b]);
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectZero];
        if (b == 0) {
           
             btn.selected  = true;
            btn.backgroundColor = YTYRGB(246, 179, 127);
        }else {
             btn.selected  = false;
            btn.backgroundColor = YTYRGB(0, 146, 63);
        }
       
        
        [btn setTitleColor:UIColor.grayColor  forState:UIControlStateNormal];
        [btn setTitle:self.btnTitles[b] forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
        [self.btns addObject:btn];
    
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
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10.0);
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
 // 確定按鈕
    [self.complete mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.mas_bottom).offset(10);
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
    
    
    for (int a = 0; a < self.btnTitles.count; a++) {
        [self.btns[a] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.state.mas_bottom).offset(10);
           if (a == 0) {
                 make.leading.equalTo(self.contentView.mas_leading).offset(10);
            }else {
                 make.leading.equalTo(self.btns[a - 1].mas_trailing).offset(10);
           }
            make.width.equalTo(self.contentView).multipliedBy(0.2);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        }];
    }
    
    
    
    
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
