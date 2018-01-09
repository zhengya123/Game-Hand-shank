//
//  PTZControlView.h
//  LeChangManage
//
//  Created by 中商国际 on 2017/12/29.
//  Copyright © 2017年 中商国际. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PZTBtn)
{
    PTZ_Top = 0,
    PTZ_Left,
    PTZ_Bottom,
    PTZ_Right
};

@protocol PTZViewDelegate <NSObject>

- (void)PTZClick:(NSInteger)pztEnum;

@end

@interface PTZControlView : UIView

@property (nonatomic, strong) UIButton * topBtn;
@property (nonatomic, strong) UIButton * leftBtn;
@property (nonatomic, strong) UIButton * bottomBtn;
@property (nonatomic, strong) UIButton * rightBtn;
@property (nonatomic, assign) id<PTZViewDelegate>delegate;

- (void)btn_NO_Enable:(BOOL)enable;
@end
