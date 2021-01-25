//
//  OneViewController.m
//  MyApp
//
//  Created by 纵昂 on 2021/1/25.
//

#import "OneViewController.h"
#import "AppDelegate.h"
@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewWillAppear:(BOOL)animated
  {
    [super viewWillAppear:animated];
    //强制旋转竖屏
      [self forceOrientationPortraitWith:self];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    self.navigationItem.title = @"哈哈竖屏";
    
    
    
}

//强制竖屏

- (void)forceOrientationPortraitWith:(UIViewController *)VC{
    
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForcePortrait=YES;
    appdelegate.isForceLandscape=NO;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:VC.view.window];
    
    //强制翻转屏幕
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationPortrait) forKey:@"orientation"];
    //刷新
    [UIViewController attemptRotationToDeviceOrientation];
}

- (BOOL)prefersStatusBarHidden{
  return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
