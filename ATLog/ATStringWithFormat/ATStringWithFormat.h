//
//  ATStringWithFormat.h
//  ATLog
//
//  Created by Yan Rabovik on 21.08.13.
//
//

#import "ATString.h"
#import "at_preprocessor_map.h"

#define _ATString_plus_comma(X) ATString(X),

#define ATStringWithFormat(fmt, ...) \
    [NSString stringWithFormat:fmt @"%@%@", \
                               _AT_MAP(_ATString_plus_comma, ##__VA_ARGS__, @"") @""]

