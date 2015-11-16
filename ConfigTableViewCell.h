//
//  UITableViewCell+ConfigTableViewCell.h
//  
//
//  Created by Ivy Zheng on 11/6/15.
//
//

#import <UIKit/UIKit.h>
#import "ConfigModel.h"

#define KConfigTableViewCell    @"KConfigTableViewCell"
#define KConfigTableLogoutCell  @"KConfigTableLogoutCell"


@interface ConfigTableViewCell : UITableViewCell

- (void)loadData:(ConfigModel*)configData withType:(NSInteger)type;

@end
