//
//  ATString.h
//  ATLog
//
//  Created by Yan Rabovik on 20.08.13.
//
//

#import <Foundation/Foundation.h>

#define ATString(expr) [ATStringBuilder stringWithType:@encode(__typeof__(expr)) \
                                                 value:(__typeof__(expr) []){ expr }]

@interface ATStringBuilder : NSObject

+(NSString *)stringWithType:(const char *)type value:(const void *)value;

@end
