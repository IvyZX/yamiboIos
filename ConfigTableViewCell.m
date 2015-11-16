//
//  UITableViewCell+ConfigTableViewCell.m
//  
//
//  Created by Ivy Zheng on 11/6/15.
//
//

#import "ConfigTableViewCell.h"
#import "ConfigModel.h"

@interface ConfigTableViewCell()
@property (strong, nonatomic) UIView *backView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UIView *valueView;

@property (nonatomic) NSInteger itemConfigIndex;
@property (strong, nonatomic) NSString* valueType;
@property (strong, nonatomic) ConfigModel* configInfo;
@end


@implementation ConfigTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:KConfigTableViewCell]) {
        [self configCell];
        if ([reuseIdentifier isEqualToString:KConfigTableViewCell]) {
            [self initView];
        } else {
            [self initLogoutView];
        }
    }
    return self;
}

- (void)configCell {
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)initView {
    
    _backView = [[UIView alloc] init];
    [self addSubview:_backView];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.bottom.equalTo(self).offset(-1);
    }];
    _backView.backgroundColor = KCOLOR_YELLOW_FDF5D8;
    
    _nameLabel = [[UILabel alloc] init];
    [_backView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(25);
        make.centerY.equalTo(self);
    }];
    _nameLabel.font = KFONT(15);
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.textColor = KCOLOR_RED_6D2C1D;
    
}


- (void) initValueView:(NSString*)value withType:(NSString*)type {
    
    if ([type isEqualToString:@"bool_button"]) {
        
        // may change to UIButton later
        UIImageView *buttonView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 8, 13)];
        UIImage *buttonImg;
        if ([value isEqualToString:@"true"])
            buttonImg = [UIImage imageNamed:@"btn-swith-on"];
        if ([value isEqualToString:@"false"])
            buttonImg = [UIImage imageNamed:@"btn-swith-off"];
        [buttonView setImage:buttonImg];
        [_backView addSubview:buttonView];
        [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-40);
            make.centerY.equalTo(self);
        }];
        
        _valueView = buttonView;
        return;
    }
    
    if ([type isEqualToString:@"text"]) {
        UILabel* valueLabel = [[UILabel alloc] init];
        [_backView addSubview:valueLabel];
        [valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-40);
            make.centerY.equalTo(self);
        }];
        valueLabel.font = KFONT(12);
        valueLabel.textColor = KCOLOR_GRAY;
        valueLabel.textAlignment = NSTextAlignmentCenter;
        valueLabel.text = value;
        
        _valueView = valueLabel;
        return;
    }
}


- (void) initLogoutView {
    
    _backView = [[UIView alloc] init];
    [self addSubview:_backView];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self).offset(50);
    }];
    //_backView.backgroundColor = KCOLOR_YELLOW_FDF5D8;
    
    _nameLabel = [[UILabel alloc] init];
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(25);
        make.width.equalTo(@250);
        make.height.equalTo(@50);
    }];
    _nameLabel.layer.cornerRadius = 5;
    _nameLabel.clipsToBounds = true;
    _nameLabel.textColor = KCOLOR_GRAY_70;
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.text = @"退出登录";
    _nameLabel.font = KFONT(16);
    _nameLabel.backgroundColor = KCOLOR_RED_6D2C1D;
}


- (void)loadData:(ConfigModel*)configData withType:(NSInteger)type {
    _itemConfigIndex = type;
    
    switch (type){
        case ConfigShowProfileImg:
            _nameLabel.text = @"显示头像";
            _valueType = @"bool_button";
            [self initValueView:[configData getField:type] withType:_valueType];
            break;
        case ConfigShowImgs:
            _nameLabel.text = @"显示图片";
            _valueType = @"bool_button";
            [self initValueView:[configData getField:type] withType:_valueType];
            break;
        case ConfigNightMode:
            _nameLabel.text = @"夜间模式";
            _valueType = @"bool_button";
            [self initValueView:[configData getField:type] withType:_valueType];
            break;
        case ConfigShowPostMode:
            _nameLabel.text = @"发帖模式";
            _valueType = @"bool_button";
            [self initValueView:[configData getField:type] withType:_valueType];
            break;
        case ConfigNonWIFINotif:
            _nameLabel.text = @"非Wi-Fi网络提示";
            _valueType = @"bool_button";
            [self initValueView:[configData getField:type] withType:_valueType];
            break;
        case ConfigClearCache:
            _nameLabel.text = @"清除缓存";
            _valueType = @"text";
            [self initValueView:@"3.14M" withType:_valueType];
            break;
        case ConfigVersion:
            _nameLabel.text = @"版本";
            _valueType = @"text";
            [self initValueView:@"1.0" withType:_valueType];
            break;
        case ConfigDevelopers:
            _nameLabel.text = @"开发者";
            break;
        case -1:
            break;
        default:
            _nameLabel.text = @"Undefined";
            _valueType = @"undefined";
            break;
    }
    return;
}

@end
