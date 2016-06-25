//
//  WYChannel.m
//  网易新闻
//
//  Created by swift on 16/6/25.
//  Copyright © 2016年 swift. All rights reserved.
//

#import "WYChannel.h"

@implementation WYChannel

- (NSString *)description {
    return [self yy_modelDescription];
}

+ (NSArray *)channelList {
    //1.URL
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"topic_news.json" withExtension:nil];
    
    //2.NSData 加载 json 的数据
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    //3.反序列化
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    //4.从 dict 中获取数组
    NSArray *array = dict[@"tList"];
    
    //5.字典转模型 -> 模型的数组
    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[self class] json:array];
    
    return [modelArray sortedArrayUsingComparator:^NSComparisonResult(WYChannel * obj1, WYChannel *obj2) {
        
        //对 tid 进行升序排列
        return [obj1.tid compare:obj2.tid];
    }];
}

@end
