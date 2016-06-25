//
//  UIImageView+CZ_WebImage.m
//  网易新闻
//
//  Created by swift on 16/6/25.
//  Copyright © 2016年 swift. All rights reserved.
//

#import "UIImageView+CZ_WebImage.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (CZ_WebImage)

- (void)cz_setImageWithURLString:(NSString *)urlString {
    
    //1.转换 URL
    NSURL *url = [NSURL URLWithString:urlString];
    
    //2.调用 SD 设置图像
    if (url != nil) {
        [self sd_setImageWithURL:url];
    }
}

@end
