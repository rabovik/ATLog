//
//  AppDelegate.m
//  ATLogExample
//
//  Created by Yan Rabovik on 20.08.13.
//
//

#import "AppDelegate.h"
#import "ATStringWithFormat.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSString *a = ATStringWithFormat(@"ABC");
    NSLog(@"%@",a);
    
    return YES;
}

@end
