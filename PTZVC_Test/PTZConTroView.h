//
//  PTZConTroView.h
//  PTZVC_Test
//
//  Created by 中商国际 on 2018/1/8.
//  Copyright © 2018年 中商国际. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTZControlView.h"
typedef NS_ENUM(NSInteger, PTZDirection)
{
    PTZControl_Top = 0,
    PTZControl_Left,
    PTZControl_Bottom,
    PTZControl_Right

};

@protocol PTZControlViewDelegate <NSObject>

- (void)panGesdirection:(PTZDirection)Dir;

@end

@interface PTZConTroView : UIView

@property (nonatomic, strong) UISwipeGestureRecognizer * swipGesLeft;
@property (nonatomic, strong) UISwipeGestureRecognizer * swipGesRight;
@property (nonatomic, strong) UISwipeGestureRecognizer * swipGesDown;
@property (nonatomic, strong) UISwipeGestureRecognizer * swipGesUp;
@property (nonatomic, strong) UIPanGestureRecognizer   * panGes;
@property (nonatomic, strong) UIView * centerView;
@property (nonatomic, strong) UIActivityIndicatorView * activityIndicatorView;
@property (nonatomic, strong) PTZControlView * clickView;
@property (nonatomic, assign) id<PTZControlViewDelegate>delegate;

- (void)shouldSwipe:(BOOL)can;
@end