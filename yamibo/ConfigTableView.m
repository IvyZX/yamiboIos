//
//  ConfigTableView.m
//  yamibo
//
//  Created by Ivy Zheng on 11/6/15.
//  Copyright © 2015 lsl. All rights reserved.
//

#import "ConfigTableView.h"
#import "ConfigTableViewCell.h"
#import "ConfigModel.h"

@interface ConfigTableView()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) ConfigModel *configInfo;
@property (strong, nonatomic) NSArray *configItems;
@property (strong, nonatomic) NSArray *systemItems;

@end

@implementation ConfigTableView

- (id)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        self.delegate = self;
        [self initItems];
        [self registerClass:[ConfigTableViewCell class] forCellReuseIdentifier:KConfigTableViewCell];
    }
    return self;
}

// change the order / content to display here
- (void)initItems {
    _configInfo = [ConfigModel loadFromLocal];
    _configItems = [[NSArray alloc] initWithObjects:
                    [NSNumber numberWithInt:ConfigShowProfileImg],
                    [NSNumber numberWithInt:ConfigShowImgs],
                    [NSNumber numberWithInt:ConfigNightMode],
                    [NSNumber numberWithInt:ConfigShowPostMode],
                    [NSNumber numberWithInt:ConfigNonWIFINotif],
                    [NSNumber numberWithInt:ConfigClearCache],
                    nil];
    _systemItems = [[NSArray alloc] initWithObjects:
                    [NSNumber numberWithInt:ConfigVersion],
                    [NSNumber numberWithInt:ConfigDevelopers],
                    nil];
    return;
}


#pragma tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _configItems.count + _systemItems.count + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _configItems.count + _systemItems.count)
        return 100.f;
    return 50.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    int the_row = (int)indexPath.row;
    NSUInteger num_config = _configItems.count;
    NSUInteger num_system = _systemItems.count;
    NSString *identifier = KConfigTableViewCell;
    NSInteger type = -1;    // for the log-out option
    
    if (the_row < num_config)
        type = [[_configItems objectAtIndex:the_row] integerValue];
    else {
        if (the_row < num_config+num_system)
            type = [[_systemItems objectAtIndex:(the_row-num_config)] integerValue];
        else {
            identifier = KConfigTableLogoutCell;
        }
    }
    
    ConfigTableViewCell *cell = [[ConfigTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    [cell loadData:_configInfo withType:type];
    return cell;
}



@end
