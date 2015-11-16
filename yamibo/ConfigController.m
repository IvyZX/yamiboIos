//
//  ConfigController.m
//  yamibo
//
//  Created by Ivy Zheng on 11/6/15.
//  Copyright © 2015 lsl. All rights reserved.
//

#import "ConfigController.h"
#import "ConfigTableView.h"

@implementation ConfigController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavigation];
    [self initTableView];
}

- (void) configNavigation {
    [self showCustomNavigationMenuButton];
    self.title = @"设置";
}

- (void)initTableView {
    ConfigTableView *tableView = [[ConfigTableView alloc] init];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}


- (void)onNavigationLeftButtonClicked {
    [[NSNotificationCenter defaultCenter] postNotificationName:KDrawerChangeNotification object:nil];
}

@end
