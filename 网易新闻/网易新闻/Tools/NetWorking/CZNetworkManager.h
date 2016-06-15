//
//  CZNetworkManager.h
//  网易新闻
//
//  Created by swift on 16/6/15.
//  Copyright © 2016年 swift. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface CZNetworkManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

/**
 *  记在网易新闻列表
 *
 *  @param channel   频道字符串
 *  @param start     开始数字
 *  @param comletion 完成回调[字典数组 / 错误]
 */
- (void)newsListWithChannel:(NSString *)channel start:(NSInteger)start completion:(void (^)(NSArray *array,NSError *error))comletion;

@end
