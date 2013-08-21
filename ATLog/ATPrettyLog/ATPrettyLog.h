//
//  ATPrettyLog.h
//  ATLog
//
//  Created by Yan Rabovik on 21.08.13.
//
//

#if !__has_feature(objc_arc)
#error This code needs ARC. Use compiler option -fobjc-arc
#endif

#define ATPrettyLog(fmt,...) \
{ \
    NSDateFormatter *df = [NSDateFormatter new]; \
    [df setDateFormat:@"HH:mm:ss.SSS"]; \
    NSString *str = \
        [NSString stringWithFormat:@"%@ %s [Line %d] " fmt, \
                                   [df stringFromDate:[NSDate date]], \
                                   __PRETTY_FUNCTION__, \
                                   __LINE__, \
                                   ##__VA_ARGS__]; \
    fprintf(stderr,"%s\n", [str UTF8String]); \
}