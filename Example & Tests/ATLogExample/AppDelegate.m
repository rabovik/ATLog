//
//  AppDelegate.m
//  ATLogExample
//
//  Created by Yan Rabovik on 20.08.13.
//
//

#import "AppDelegate.h"

// Uncomment next line to use NSLog instead of ATPrettyLog
//#define ATLog_OUTPUT(fmt, args...) NSLog(fmt,args)

#import "ATLog.h"

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
    
    // we can use ATLog which is easier to use
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
    
    // ATConcatLog may be more readable in some cases:
    ATConcatLog(@"\n RootViewController: ", self.window.rootViewController,
                @"\n Frame: ", self.window.frame,
                @"\n Center: ", self.window.center,
                @"\n Transform: ", self.window.transform,
                @"\n Alignment rect insects: ", self.window.alignmentRectInsets,
                @"\n Is keyWindow: ", self.window.keyWindow);
    
    // Common structs, primitives, C-strings are automatically converted to NSStrings:
    ATConcatLog("float: ", 3.14f, "; int: ", 13, "; unsigned: ", 169u, ".");
    
    // Another macro for easy logging objects, structs and primitives.
    // Each argument is logged in a separate line:
    ATLogEach(@"Window properties:",
              self.window.rootViewController,
              self.window.frame,
              self.window.center,
              self.window.transform,
              self.window.alignmentRectInsets,
              self.window.keyWindow);
    
    // ATLog may be used without arguments:
    ATLog();
    
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
