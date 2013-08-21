//
//  AppDelegate.m
//  ATLogExample
//
//  Created by Yan Rabovik on 20.08.13.
//
//

#import "AppDelegate.h"
#import "ATStringWithFormat.h"
#import "ATLog.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSLog(@"\n RootViewController: %@ \
            \n Frame: %@ \
            \n Center: %@ \
            \n Transform: %@ \
            \n Alignment rect insects: %@ \
            \n keyWindow: %d",
          self.window.rootViewController,
          NSStringFromCGRect(self.window.frame),
          NSStringFromCGPoint(self.window.center),
          NSStringFromCGAffineTransform(self.window.transform),
          NSStringFromUIEdgeInsets(self.window.alignmentRectInsets),
          self.window.keyWindow);
    
    ATLog(@"\n RootViewController: %@ \
          \n Frame: %@ \
          \n Center: %@ \
          \n Transform: %@ \
          \n Alignment rect insects: %@ \
          \n keyWindow: %@",
          self.window.rootViewController,
          self.window.frame,
          self.window.center,
          self.window.transform,
          self.window.alignmentRectInsets,
          self.window.keyWindow);
    
    NSLog(@"M_PI = %f;", M_PI);
    ATLog(@"M_PI = %@;", M_PI);
        
    return YES;
}

@end
