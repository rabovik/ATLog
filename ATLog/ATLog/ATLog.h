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

#define ATConcatLog(items...) \
{ \
    NSString *__atcl_str = ATStringFromComponents(items); \
    ATLog(@"%@",__atcl_str); \
}

#define ATLogEach(items...) \
{ \
    id __atle_array[] = { _AT_MAP(_ATString_plus_comma, items) }; \
    int __atle_n = sizeof(__atle_array)/sizeof(id); \
    for(int i = 0; i < __atle_n; ++i){ \
        ATLog(@"%@) %@",i,__atle_array[i]); \
    } \
}