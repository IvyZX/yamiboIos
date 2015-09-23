//
//  CollectTableViewCell.m
//  yamibo
//
//  Created by 李思良 on 15/9/20.
//  Copyright © 2015年 lsl. All rights reserved.
//

#import "CollectTableViewCell.h"

@interface CollectTableViewCell()
@property (strong, nonatomic) UIView *backView;

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UILabel *commentLabel;
@end

@implementation CollectTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configCell];
        [self initBack];
        [self initContent];
    }
    return self;
}
- (void)configCell {
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
- (void)initBack {
    _backView = [[UIView alloc] init];
    [self addSubview:_backView];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.bottom.equalTo(self).offset(-1);
    }];
    _backView.backgroundColor = KCOLOR_YELLOW_FDF5D8;
}
- (void)initContent {
    _titleLabel = [[UILabel alloc] init];
    [_backView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(23);
        make.top.mas_equalTo(20);
        make.centerX.equalTo(_backView);
    }];
    _titleLabel.font = KFONT(14);
    _titleLabel.textColor = KCOLOR_RED_6D2C1D;
    
    _nameLabel = [[UILabel alloc] init];
    [_backView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel);
        make.top.equalTo(_titleLabel.mas_bottom).offset(15);
    }];
    _nameLabel.font = KFONT(8);
    _nameLabel.textColor = KCOLOR_GRAY;
    
    _timeLabel = [[UILabel alloc] init];
    [_backView addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(_nameLabel);
        make.centerX.equalTo(_backView);
    }];
    _timeLabel.font = KFONT(8);
    _timeLabel.textColor = KCOLOR_GRAY;
    
    _commentLabel = [[UILabel alloc] init];
    [_backView addSubview:_commentLabel];
    [_commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(_nameLabel);
        make.right.equalTo(_backView).offset(-23);
    }];
    _commentLabel.font = KFONT(8);
    _commentLabel.textColor = KCOLOR_GRAY;
    
    UIImageView *tint = [[UIImageView alloc] init];
    [_backView addSubview:tint];
    [tint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_commentLabel.mas_left).offset(-4);
        make.top.bottom.equalTo(_commentLabel);
        make.width.mas_equalTo(8);
    }];
    tint.backgroundColor = [UIColor redColor];
}
- (void)loadData {
    _titleLabel.text = @"标题标题标题";
    _nameLabel.text = @"作者";
    _timeLabel.text = @"2015-09-20";
    _commentLabel.text = @"999";
}

@end
