//
//  PTZConTroView.m
//  PTZVC_Test
//
//  Created by 中商国际 on 2018/1/8.
//  Copyright © 2018年 中商国际. All rights reserved.
//

#import "PTZConTroView.h"
#define View_W 40
@interface PTZConTroView()<UIGestureRecognizerDelegate,PTZViewDelegate>

@end
@implementation PTZConTroView
{
    NSString * gesDirection;

}

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        
        [self addSubview:self.clickView];
        [self addSubview:self.centerView];
        [self.centerView addSubview:self.activityIndicatorView];
        
        self.swipGesLeft  = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
        self.swipGesRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
        self.swipGesDown  = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
        self.swipGesUp    = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
        
        [self.swipGesUp setDirection:UISwipeGestureRecognizerDirectionUp];
        [self.swipGesLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
        [self.swipGesRight setDirection:UISwipeGestureRecognizerDirectionRight];
        [self.swipGesDown setDirection:UISwipeGestureRecognizerDirectionDown];
        
        self.panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGes:)];
        self.panGes.delegate = self;
        self.swipGesLeft.delegate  = self;
        self.swipGesRight.delegate = self;
        self.swipGesDown.delegate  = self;
        self.swipGesUp.delegate    = self;
        [self addGestureRecognizer:self.panGes];
        [self addGestureRecognizer:self.swipGesUp];
        [self addGestureRecognizer:self.swipGesDown];
        [self addGestureRecognizer:self.swipGesRight];
        [self addGestureRecognizer:self.swipGesLeft];
        
        self.layer.cornerRadius = frame.size.width/2;
        
    }
    return self;
}
- (void)swipeLeft:(UISwipeGestureRecognizer *)recognizer{
    
    if(recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
       gesDirection = @"down";
        
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
       gesDirection = @"up";
        
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
       gesDirection = @"left";
        
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
       gesDirection = @"right";
        
    }
    
}

- (void)layoutSubviews{
    
    self.centerView.frame = CGRectMake(self.frame.size.width/2 - View_W/2, self.frame.size.height/2 - View_W/2, View_W, View_W);
    self.centerView.layer.cornerRadius = View_W/2;
    self.activityIndicatorView.frame = CGRectMake(0, 0, View_W, View_W);

}
- (void)panGes:(UIPanGestureRecognizer *)ges{
    
    
    CGPoint location    = [ges locationInView:self];
    
    if (location.x >= View_W/2 && location.x <= self.frame.size.width - View_W/2 && location.y >= View_W/2 && location.y <= self.frame.size.height - View_W/2) {
        
        CGFloat locaX;
        CGFloat locaY;
        if (location.x<= 75) {
            locaX =75- location.x;
        }else{
            locaX = location.x - 75;
        }
        
        if (location.y <= 75) {
            locaY = 75 -location.y;
        }else{
            locaY = location.y - 75;
        
        }
        
        if (locaX * locaX + locaY * locaY <= 55 * 55) {
            self.centerView.frame = CGRectMake(location.x - 20, location.y - 20, 40, 40);
            
        }else{
            //CGPoint locations = CGPointMake(55, 55);
            //[self.delegate panGesPoint:locations];
        }
        
    }
   
    if (ges.state == UIGestureRecognizerStateEnded || ges.state == UIGestureRecognizerStateCancelled) {
        //手势结束
        self.centerView.frame = CGRectMake(self.frame.size.width/2 - 20, self.frame.size.height/2 - 20, 40, 40);
        if ([gesDirection isEqualToString:@"up"]) {
            [self.delegate panGesdirection:PTZControl_Top];
        }else if ([gesDirection isEqualToString:@"left"]){
            [self.delegate panGesdirection:PTZControl_Left];
        }else if ([gesDirection isEqualToString:@"down"]){
            [self.delegate panGesdirection:PTZControl_Bottom];
        }else if ([gesDirection isEqualToString:@"right"]){
            [self.delegate panGesdirection:PTZControl_Right];
        }
        [self.activityIndicatorView startAnimating];
    }
}
- (void)PTZClick:(NSInteger)pztEnum{
    switch (pztEnum) {
        case PTZ_Top:
        {
            [self.delegate panGesdirection:PTZControl_Top];
        }
            break;
        case PTZ_Left:
        {
            [self.delegate panGesdirection:PTZControl_Left];
        }
            break;
        case PTZ_Bottom:
        {
            [self.delegate panGesdirection:PTZControl_Bottom];
        }
            break;
        case PTZ_Right:
        {
            [self.delegate panGesdirection:PTZControl_Right];
        }
            break;
            
        default:
            break;
    }

    [self.activityIndicatorView startAnimating];
}
#pragma mark - 手势代理
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
- (void)shouldSwipe:(BOOL)can{
    
        self.panGes.enabled       = can;
        self.swipGesLeft.enabled  = can;
        self.swipGesRight.enabled = can;
        self.swipGesDown.enabled  = can;
        self.swipGesUp.enabled    = can;
    [self.clickView btn_NO_Enable:can];
    if (can == YES) {
        [self.activityIndicatorView stopAnimating];
    }else{
        [self.activityIndicatorView startAnimating];
    }
}
#pragma mark - lan
- (UIView *)centerView{
    if (_centerView == nil) {
        _centerView = [UIView new];
        _centerView.backgroundColor = [UIColor whiteColor];
        _centerView.layer.borderWidth = 1.0f;
        _centerView.layer.borderColor = [UIColor blackColor].CGColor;
    }
    return _centerView;
}
- (PTZControlView *)clickView{
    if (_clickView == nil) {
        _clickView = [[PTZControlView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
        _clickView.delegate = self;
        _clickView.clipsToBounds = YES;
        _clickView.transform = CGAffineTransformMakeRotation(-M_PI/4);
        _clickView.layer.cornerRadius = 75;
        _clickView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _clickView.layer.borderWidth = 1.0f;
    }
    return _clickView;
}
- (UIActivityIndicatorView *)activityIndicatorView{
    if (_activityIndicatorView == nil) {
        _activityIndicatorView = [UIActivityIndicatorView new];
        _activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        //_activityIndicatorView.color = [UIColor grayColor];
    }
    return _activityIndicatorView;
}
@end
