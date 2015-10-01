//
//  MessageModel.h
//  yamibo
//
//  Created by shuang yang on 9/30/15.
//  Copyright © 2015 lsl. All rights reserved.
//

#import "JSONModel.h"

@protocol MessageModel
@end

@interface MessageModel : JSONModel

@property   (strong, nonatomic) NSString *toId;
@property   (strong, nonatomic) NSString *toName;
@property   (strong, nonatomic) NSString *lastId;
@property   (strong, nonatomic) NSString *date;
@property   (strong, nonatomic) NSString *summary;

@end

@interface MessageListModel : JSONModel

@property (strong, nonatomic) NSArray<MessageModel> *msgList;

@end
