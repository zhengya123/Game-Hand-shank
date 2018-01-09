//
//  PTZControlView.m
//  LeChangManage
//
//  Created by 中商国际 on 2017/12/29.
//  Copyright © 2017年 中商国际. All rights reserved.
//

#import "PTZControlView.h"
#import "CommonMethod.h"
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height
#define ViewFrame 150
#define btn_W 73
@implementation PTZControlView


- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        
        [self addSubview:self.topBtn];
        [self addSubview:self.leftBtn];
        [self addSubview:self.bottomBtn];
        [self addSubview:self.rightBtn];
        
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.leftBtn.frame   = CGRectMake(0, 0, btn_W, btn_W);
    self.bottomBtn.frame = CGRectMake(0, ViewFrame - btn_W, btn_W, btn_W);
    self.rightBtn.frame  = CGRectMake(ViewFrame - btn_W, ViewFrame - btn_W, btn_W, btn_W);
    self.topBtn.frame    = CGRectMake(ViewFrame - btn_W, 0, btn_W, btn_W);

    
}

- (void)topClick:(UIButton *)btn{
    
    [self.delegate PTZClick:PTZ_Top];
    
}
- (void)leftClick:(UIButton *)btn{
    
    [self.delegate PTZClick:PTZ_Left];
    
}
- (void)bottomClick:(UIButton *)btn{
    
    [self.delegate PTZClick:PTZ_Bottom];
    

}
- (void)rightClick:(UIButton *)btn{
    
    [self.delegate PTZClick:PTZ_Right];
    
}
- (void)btn_NO_Enable:(BOOL)enable{
    self.topBtn.enabled    = enable;
    self.leftBtn.enabled   = enable;
    self.bottomBtn.enabled = enable;
    self.rightBtn.enabled  = enable;

}

- (UIButton *)topBtn{
    if (_topBtn == nil) {
        _topBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_topBtn setBackgroundImage:[UIImage imageNamed:@"top"] forState:UIControlStateNormal];
        [_topBtn setBackgroundImage:[UIImage imageNamed:@"top_select"] forState:UIControlStateHighlighted];
        [_topBtn addTarget:self action:@selector(topClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _topBtn;
}
- (UIButton *)leftBtn{
    if (_leftBtn == nil) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"left_select"] forState:UIControlStateHighlighted];
        [_leftBtn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}
- (UIButton *)bottomBtn{
    if (_bottomBtn == nil) {
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bottomBtn setBackgroundImage:[UIImage imageNamed:@"bottom"] forState:UIControlStateNormal];
        [_bottomBtn setBackgroundImage:[UIImage imageNamed:@"bottom_select"] forState:UIControlStateHighlighted];
        [_bottomBtn addTarget:self action:@selector(bottomClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomBtn;
}
- (UIButton *)rightBtn{
    if (_rightBtn == nil) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"right_select"] forState:UIControlStateHighlighted];
        [_rightBtn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}
@end
