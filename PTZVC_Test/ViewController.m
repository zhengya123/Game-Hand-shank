//
//  ViewController.m
//  PTZVC_Test
//
//  Created by 中商国际 on 2018/1/5.
//  Copyright © 2018年 中商国际. All rights reserved.
//

#import "ViewController.h"
#import "PTZConTroView.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<PTZControlViewDelegate>
@property (nonatomic, strong) UIButton       * navBtn;
@property (nonatomic, strong) PTZConTroView  * ptzControlView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navBtn.frame = CGRectMake(0, 80, SCREEN_W, 40);
    [self.view addSubview:self.navBtn];
    
    [self.view addSubview:self.ptzControlView];
}
- (void)panGesdirection:(PTZDirection)Dir{
    switch (Dir) {
        case PTZControl_Top:
        {
            NSLog(@"上");
        }
            break;
            case PTZControl_Left:
        {
            NSLog(@"左");
        }
            break;
        case PTZControl_Bottom:
        {
            NSLog(@"下");
        }
            break;
        case PTZControl_Right:
        {
            NSLog(@"右");
        }
            break;
        default:
            break;
    }

    [self.ptzControlView shouldSwipe:NO];
    __weak typeof(self) weakSelf = self;
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2/*延迟执行时间*/ * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        
        [weakSelf.ptzControlView shouldSwipe:YES];
    });

}

- (void)ptzControlClick:(UIButton *)btn{
    CATransition *animation = [CATransition animation];
    if (self.ptzControlView.hidden == YES) {
        animation.type = @"oglFlip";
        animation.duration = 0.6f;
        [self.ptzControlView.layer addAnimation:animation forKey:nil];
        self.ptzControlView.hidden = NO;
    }else{
        animation.type = kCATransitionMoveIn;
        animation.duration = 0.5f;
        [self.ptzControlView.layer addAnimation:animation forKey:nil];
        self.ptzControlView.hidden = YES;
    }
    
}
- (UIButton *)navBtn{
    if (_navBtn == nil) {
        _navBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _navBtn.frame = CGRectMake(0, 0, 40, 40);
        [_navBtn setTitle:@"PTZ" forState:UIControlStateNormal];
        [_navBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_navBtn addTarget:self action:@selector(ptzControlClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _navBtn;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (PTZConTroView *)ptzControlView{
    if (_ptzControlView == nil) {
        _ptzControlView = [[PTZConTroView alloc]initWithFrame:CGRectMake(SCREEN_W/2 - 75, SCREEN_H/2 - 75, 150, 150)];
        _ptzControlView.delegate = self;
        _ptzControlView.clipsToBounds = YES;
        _ptzControlView.layer.borderColor = [UIColor blackColor].CGColor;
        _ptzControlView.layer.borderWidth = 1.0f;
    }
    return _ptzControlView;
}

@end
