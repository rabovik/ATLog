//
//  ATLog.h
//  ATLog
//
//  Created by Yan Rabovik on 21.08.13.
//
//

#import "ATStringWithFormat.h"

#define ATLog(fmt...) NSLog(@"%@",ATStringWithFormat(fmt))
