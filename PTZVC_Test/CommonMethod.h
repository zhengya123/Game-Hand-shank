//
//  CommonMethod.h
//  LeChangManage
//
//  Created by 中商国际 on 2017/11/13.
//  Copyright © 2017年 中商国际. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CommonMethod : NSObject

//颜色转图片
+ (UIImage *)imageWithColor:(UIColor *)color;
/**
 * 获取字符串长度
 */
+ (CGFloat)heightWithString:(NSString*)string
                   fontSize:(CGFloat)fontSize
                      width:(CGFloat)width;
#pragma mark - 获取字符串宽度
+ (CGFloat)stringWithSize:(NSString*)string
               fontOfSize:(CGFloat)font;
@end
