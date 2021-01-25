//
//  ViewController.m
//  MyApp
//
//  Created by 纵昂 on 2021/1/25.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "OneViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton * editeBtn;
@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated
  {
    [super viewWillAppear:animated];
    //强制旋转竖屏
    [self forceOrientationLandscape];
    //强制翻转屏幕，Home键在右边。
    [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
    //刷新
    [UIViewController attemptRotationToDeviceOrientation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    self.navigationItem.title = @"哈哈横屏";
    
    
    _editeBtn = [[UIButton alloc]initWithFrame:CGRectMake(25, 0, 50, 50)];
   [_editeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_editeBtn setTitle:@"点我啊!" forState:UIControlStateNormal];
    [_editeBtn addTarget:self action:@selector(editeClickBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:_editeBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    
/*
 各位大佬，我想求一个简单的demo。就写两个页面，全局只支持横屏right，页面附带导航栏，push到第二个页面的时候让第二个页面竖屏显示，返回之后再保持横屏right[表情]
 **/
    
    [UIViewController attemptRotationToDeviceOrientation];
    
    
    
}

#pragma  mark 横屏设置
//强制横屏
- (void)forceOrientationLandscape
{
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
   appdelegate.isForceLandscape=YES;
   appdelegate.isForcePortrait=NO;
  [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
}



- (BOOL)prefersStatusBarHidden{
  return YES;
}

-(void)editeClickBtn{
    
    [self.navigationController pushViewController:[[OneViewController alloc]init] animated:YES];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] init];
    backBtn.title = @"返回";
    self.navigationItem.backBarButtonItem = backBtn;
    self.hidesBottomBarWhenPushed=NO;
    
}

@end
