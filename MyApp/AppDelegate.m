//
//  AppDelegate.m
//  MyApp
//
//  Created by 纵昂 on 2021/1/25.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window.backgroundColor =[UIColor whiteColor];
    ViewController *baseView = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:baseView];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
  if (self.isForceLandscape) {
      return UIInterfaceOrientationMaskLandscape;
  }else if (self.isForcePortrait){
      return UIInterfaceOrientationMaskPortrait;
  }
  return UIInterfaceOrientationMaskPortrait;
}


@end
