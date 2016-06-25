//
//  WYChannel.h
//  网易新闻
//
//  Created by swift on 16/6/25.
//  Copyright © 2016年 swift. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYChannel : NSObject
/**
 *  频道名称
 */
@property (nonatomic,copy) NSString *tname;
/**
 *  频道 ID
 */
@property (nonatomic,copy) NSString *tid;

/**
 *  返回频道数组模型
 */
+ (NSArray *)channelList;

@end
