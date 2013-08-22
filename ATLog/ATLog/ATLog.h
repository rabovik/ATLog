//
//  ATLog.h
//  ATLog
//
//  Created by Yan Rabovik on 21.08.13.
//
//

#import "ATStringWithFormat.h"
#import "ATPrettyLog.h"

#define ATLog(fmt...) ATPrettyLog(@"%@",ATStringWithFormat(fmt))

#define ATConcatLog(items...) \
{ \
    NSArray *array = @[ _AT_MAP(_ATString_plus_comma, items) ]; \
    ATLog(@"%@",[array componentsJoinedByString:@""]); \
}

#define ATLogEach(items...) \
{ \
    id array[] = { _AT_MAP(_ATString_plus_comma, items) }; \
    int n = sizeof(array)/sizeof(id); \
    for(int i=0; i<n; ++i){ \
        ATLog(@"%@) %@",i,array[i]); \
    } \
}