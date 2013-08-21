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
#import "ATPrettyLog.h"

@implementation AppDelegate

- (void)logExample{
    
    // Instead of NSLog:
    NSLog(@"\n RootViewController: %@ \
            \n Frame: %@ \
            \n Center: %@ \
            \n Transform: %@ \
            \n Alignment rect insects: %@ \
            \n Is keyWindow: %d",
          self.window.rootViewController,
          NSStringFromCGRect(self.window.frame),
          NSStringFromCGPoint(self.window.center),
          NSStringFromCGAffineTransform(self.window.transform),
          NSStringFromUIEdgeInsets(self.window.alignmentRectInsets),
          self.window.keyWindow);
    
    // We can use ATLog which is easier to use
    // and produces better output:
    ATLog(@"\n RootViewController: %@ \
            \n Frame: %@ \
            \n Center: %@ \
            \n Transform: %@ \
            \n Alignment rect insects: %@ \
            \n Is keyWindow: %@",
          self.window.rootViewController,
          self.window.frame,
          self.window.center,
          self.window.transform,
          self.window.alignmentRectInsets,
          self.window.keyWindow);
    
    // Common structs and primitives are automatically converted to strings:
    ATLog(@"float: %@; int: %@; unsigned: %@.", 3.14f, 13, 169u);
    
    // Another macro for easy logging objects, structs and primitives:
    ATLogItems(@"Window properties:",
               self.window.rootViewController,
               self.window.frame,
               self.window.center,
               self.window.transform,
               self.window.alignmentRectInsets,
               self.window.keyWindow);
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
            
    [self logExample];
        
    return YES;
}

@end
