//
//  CZNetworkManager.m
//  网易新闻
//
//  Created by swift on 16/6/15.
//  Copyright © 2016年 swift. All rights reserved.
//

#import "CZNetworkManager.h"

@implementation CZNetworkManager

+ (instancetype)sharedManager {
    
    static CZNetworkManager *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //末尾要有反斜线
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/article/"];
        
        instance = [[self alloc] initWithBaseURL:baseURL];
    });
    return instance;
}

@end
