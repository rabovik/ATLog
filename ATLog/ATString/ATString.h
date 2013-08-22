//
//  ATString.h
//  ATLog
//
//  Created by Yan Rabovik on 20.08.13.
//
//

#import <Foundation/Foundation.h>
#import "at_preprocessor_map.h"

#define ATString(expr) [ATStringBuilder stringWithType:@encode(__typeof__(expr)) \
                                                 value:(__typeof__(expr) []){ expr }]

#define _ATString_plus_comma(X) ATString(X),

#define ATStringWithFormat(fmt, ...) \
    [NSString stringWithFormat:fmt @"%@%@", \
                               _AT_MAP(_ATString_plus_comma, ##__VA_ARGS__, @"") @""]

#define ATStringFromComponents(components...) \
    [@[ _AT_MAP(_ATString_plus_comma, components) ] componentsJoinedByString:@""]

@interface ATStringBuilder : NSObject

+(NSString *)stringWithType:(const char *)type value:(const void *)value;

@end
