# Game-Hand-shank
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
