//
//  ConfigModel.h
//  yamibo
//
//  Created by Ivy Zheng on 11/9/15.
//  Copyright © 2015 lsl. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol ConfigModel <NSObject>
@end

// 作为每个设置选项的index使用
typedef NS_ENUM(NSInteger, ConfigItemIndex) {
    
    // stored in the model
    ConfigShowProfileImg,
    ConfigShowImgs,
    ConfigNightMode,
    ConfigShowPostMode,
    ConfigNonWIFINotif,
    
    // used by the views but not stored in the model
    ConfigClearCache,
    ConfigVersion,
    ConfigDevelopers,
};

@interface ConfigModel : JSONModel

@property (strong, nonatomic) NSMutableArray *dataArray;

- (NSString*) getField:(ConfigItemIndex)configIndex;

- (void) saveToLocal;

+ (ConfigModel*) loadFromLocal;

@end
