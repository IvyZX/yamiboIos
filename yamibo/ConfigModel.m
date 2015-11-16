//
//  ConfigModel.m
//  yamibo
//
//  Created by Ivy Zheng on 11/9/15.
//  Copyright © 2015 lsl. All rights reserved.
//

#import "ConfigModel.h"

@implementation ConfigModel

- (id)init {
    if (self = [super init]) {
        int numOfEntries = 5;
        _dataArray = [[NSMutableArray alloc] initWithCapacity:numOfEntries];
        _dataArray[ConfigShowProfileImg] = @"true";
        _dataArray[ConfigShowImgs] = @"true";
        _dataArray[ConfigNightMode] = @"false";
        _dataArray[ConfigShowPostMode] = @"false";
        _dataArray[ConfigNonWIFINotif] = @"true";
    }
    return self;
}

- (NSString*) getField:(ConfigItemIndex)configIndex {
    return [_dataArray objectAtIndex:configIndex];
}

- (void) saveToLocal {
    // 待做：保存设定到本地
    
    return;
}

+ (ConfigModel*) loadFromLocal {
    // 待做：从本地读取设定
    ConfigModel* model = [[ConfigModel alloc] init];
    return model;
}

@end
