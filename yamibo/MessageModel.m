//
//  MessageModel.m
//  yamibo
//
//  Created by shuang yang on 9/30/15.
//  Copyright © 2015 lsl. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"lastauthorid": @"authorId",
                                                       @"lastauthor": @"authorName",
                                                       @"lastdateline": @"date",
                                                       @"lastsummary": @"summary"
                                                       }];
}
@end

@implementation MessageListModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"Variables.list": @"msgList"
                                                       }];
}

@end
