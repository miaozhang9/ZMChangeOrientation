# ZMChangeOrientation
##  切换页面横屏竖屏
### 核心类BaseNavigationController、BaseViewController

```
核心代码：
BaseNavigationController

- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view.

[[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange) name:UIDeviceOrientationDidChangeNotification object:nil];
}


- (BOOL)shouldAutorotate
{
return [self.topViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
return [self.topViewController supportedInterfaceOrientations];
}


- (void)deviceOrientationDidChange
{
NSLog(@"NAV deviceOrientationDidChange:%ld",(long)[UIDevice currentDevice].orientation);
if([UIDevice currentDevice].orientation == UIDeviceOrientationPortrait) {
[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
[self orientationChange:NO];
//注意： UIDeviceOrientationLandscapeLeft 与 UIInterfaceOrientationLandscapeRight
} else if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft) {
[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
[self orientationChange:YES];
}
}

- (void)orientationChange:(BOOL)landscapeRight
{
CGFloat width = [UIScreen mainScreen].bounds.size.width;
CGFloat height = [UIScreen mainScreen].bounds.size.height;
if (landscapeRight) {
[UIView animateWithDuration:0.2f animations:^{
self.view.transform = CGAffineTransformMakeRotation(M_PI_2);
self.view.bounds = CGRectMake(0, 0, width, height);
}];
} else {
[UIView animateWithDuration:0.2f animations:^{
self.view.transform = CGAffineTransformMakeRotation(0);
self.view.bounds = CGRectMake(0, 0, width, height);
}];
}
}

```

```
BaseViewController

- (BOOL)shouldAutorotate
{
return NO;
}

- (void)interfaceOrientation:(UIInterfaceOrientation)orientation
{
if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
SEL selector             = NSSelectorFromString(@"setOrientation:");
NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
[invocation setSelector:selector];
[invocation setTarget:[UIDevice currentDevice]];
int val                  = orientation;
// 从2开始是因为0 1 两个参数已经被selector和target占用
[invocation setArgument:&val atIndex:2];
[invocation invoke];
}
}
```
## 实际调用：
```
MainViewController 继承BaseViewController

- (void)leftAction
{
  [self interfaceOrientation:UIInterfaceOrientationPortrait];
}

- (void)rightAction
{
//    [self interfaceOrientation:UIInterfaceOrientationLandscapeRight];
}

```



