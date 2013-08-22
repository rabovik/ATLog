//
//  ATLog.h
//  ATLog
//
//  Created by Yan Rabovik on 21.08.13.
//
//

#import "ATString.h"
#import "ATPrettyLog.h"

#ifdef ATLog_OUTPUT
#   define ATLog(fmt...) ATLog_OUTPUT(@"%@",ATStringWithFormat(fmt))
#else
#   define ATLog(fmt...) ATPrettyLog(@"%@",ATStringWithFormat(fmt))
#endif

#define ATConcatLog(items...) NSLog(@"%@",ATStringFromComponents(items))

#define ATLogEach(items...) \
{ \
    id array[] = { _AT_MAP(_ATString_plus_comma, items) }; \
    int n = sizeof(array)/sizeof(id); \
    for(int i=0; i<n; ++i){ \
        ATLog(@"%@) %@",i,array[i]); \
    } \
}