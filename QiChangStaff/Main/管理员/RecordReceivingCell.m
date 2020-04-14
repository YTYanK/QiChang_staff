//
//  RecordReceivingCell.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/13.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "RecordReceivingCell.h"
#import "YTYLabel.h"

@implementation RecordReceivingCell


- (UIImageView *)icon {
    if (_icon == nil) {
        _icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"产品"]];
        [self addSubview:_icon];
    }
    return _icon;
}
- (YTYLabel *)title {
    if (_title == nil) {
         _title = [[YTYLabel alloc] initWithFrame:CGRectZero];
             _title.font = [UIFont systemFontOfSize:12 weight:UIFontWeightBold];
              _title.textColor = UIColor.blackColor;
              _title.numberOfLines = 5;
              [self addSubview:_title];
    }
    return _title;
}
- (UIImageView *)icon2 {
    if (_icon2 == nil) {
           _icon2 = [[UIImageView alloc] initWithFrame:CGRectZero];
           [self addSubview:_icon2];
       }
       return _icon2;
}
- (UILabel *)area {
    if (_area == nil) {
          _area = [[UILabel alloc] initWithFrame:CGRectZero];
             _area.font = [UIFont systemFontOfSize:14 weight:UIFontWeightBold];
             [self addSubview:_area];
    }
    return _area;
}
- (UILabel *)type {
    if (_type == nil) {
        _type = [[UILabel alloc] initWithFrame:CGRectZero];
              _type.numberOfLines = 2;
              [self addSubview:_type];
    }
    return _type;
}
- (UILabel *)number{
    if (_number == nil) {

        _number = [[UILabel alloc] initWithFrame:CGRectZero];
              _number.numberOfLines = 2;
              [self addSubview:_number];
    }
    return _number;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    [self icon];
    [self title];
    [self icon2];
    [self area];
    [self type];
    [self number];
}
- (void)setFrame:(CGRect)frame {
     if (self.indexPath.row == 0) {
         [super setFrame:frame];
     }else {
         frame.origin.y += 15;
        frame.size.height -= 15;
        [super setFrame:frame];
         
     }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+ (instancetype)initCellWithCellView:(UITableView *)tableView reuseIdentifier:(NSString *)identifier indexPath:(NSIndexPath *)index {
    RecordReceivingCell *cell = [super initCellWithCellView:tableView reuseIdentifier:identifier];
    cell.indexPath = index;

    CGFloat icon_wh = YTY_DP_375(16);
              [cell.icon mas_makeConstraints:^(MASConstraintMaker *make) {
                  make.top.equalTo(cell).with.offset(16);
                  make.left.equalTo(cell).with.offset(20);
                  make.height.mas_equalTo(icon_wh);
                  make.width.mas_equalTo(icon_wh);
              }];

              [cell.title mas_makeConstraints:^(MASConstraintMaker *make) {
                  make.top.equalTo(cell).with.offset(16);
                  make.left.equalTo(cell.icon.mas_right).with.offset(10);
                  make.width.equalTo(cell.contentView).with.multipliedBy(0.65);
              }];
              
            [cell.number mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(cell).with.offset(-8);
                make.left.equalTo(cell.type.mas_right).with.offset(5);
                make.right.equalTo(cell).with.offset(-20);
            }];
    
    
    
      if (index.section == 0) {
//          [cell.areaCenterY uninstall]; //删除样式
//          [cell.areaTop install]; // 添加
          [cell.number setHidden:NO];
            [cell.type mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(cell).with.offset(-8);
                make.left.equalTo(cell).with.offset(20);
                make.width.mas_equalTo(SCREEN_WIDTH * 0.4);
            }];
          
            [cell.area mas_remakeConstraints:^(MASConstraintMaker *make) {
              cell.areaTop =  make.top.equalTo(cell).with.offset(16);
              make.right.equalTo(cell).with.offset(-20);
              make.height.mas_offset(22);
            }];
          
      }else {
            [cell.number setHidden:YES];
            [cell.type mas_remakeConstraints:^(MASConstraintMaker *make) {
                 make.bottom.equalTo(cell).with.offset(-8);
                 make.left.equalTo(cell).with.offset(20);
                 make.width.mas_equalTo(SCREEN_WIDTH * 0.8);
             }];
            [cell.area mas_remakeConstraints:^(MASConstraintMaker *make) {
                cell.areaCenterY =  make.centerY.equalTo(cell).with.offset(0);
                make.right.equalTo(cell).with.offset(-20);
                make.height.mas_offset(22);
            }];
      }
   [cell.icon2 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.centerY.equalTo(cell.area.mas_centerY).with.offset(0);
       make.right.equalTo(cell.area.mas_left).with.offset(-5);
       make.height.mas_equalTo(icon_wh);
       make.width.mas_equalTo(icon_wh);
   }];
    NSLog(@"----->-->%ld",(long)index.section);
    return cell;
}


@end
