//
//  ATString.m
//  ATLog
//
//  Created by Yan Rabovik on 20.08.13.
//
//

#import "ATString.h"

#if !__has_feature(objc_arc)
#error This code needs ARC. Use compiler option -fobjc-arc
#endif

static NSString *typeMatch(NSString *type, NSString *pattern){
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:pattern
                                  options:NSRegularExpressionAnchorsMatchLines
                                  error:&error];
    NSCAssert(nil == error, @"TypeMatch error is not nil");
    NSTextCheckingResult *match = [regex
                                   firstMatchInString:type
                                   options:0
                                   range:NSMakeRange(0, [type length])];
    if (match && [match numberOfRanges] > 1) {
        return [type substringWithRange:[match rangeAtIndex:1]];
    }
    return nil;
}


@implementation ATStringBuilder

+(NSString *)stringWithType:(const char *)type value:(const void *)valueRef{
    
    // Foundation
    if (strcmp(@encode(id), type) == 0){
        __unsafe_unretained id object = *(__unsafe_unretained id *)valueRef;
        
        if (nil == object) return @"(nil)";
        
        if ([object isKindOfClass:[NSString class]]) {
            return [object copy];
        }
        
        if ([object isKindOfClass:NSClassFromString(@"Protocol")]) {
            return NSStringFromProtocol(object);
        }
        
        return [NSString stringWithFormat:@"%@",object];
    }
    
    if (strcmp(@encode(Class), type) == 0){
        return NSStringFromClass(*(Class *)valueRef);
    }
    
    if (strcmp(":", type) == 0){
        return NSStringFromSelector(*(SEL *)valueRef);
    }
    
    if (strcmp(@encode(NSRange), type) == 0){
        return NSStringFromRange(*(NSRange *)valueRef);
    }
    
    // CoreGraphics
    if (strcmp(@encode(CGRect), type) == 0){
        return NSStringFromCGRect(*(CGRect *)valueRef);
    }
    
    if (strcmp(@encode(CGPoint), type) == 0){
        return NSStringFromCGPoint(*(CGPoint *)valueRef);
    }
    
    if (strcmp(@encode(CGSize), type) == 0){
        return NSStringFromCGSize(*(CGSize *)valueRef);
    }
    
    if (strcmp(@encode(CGAffineTransform), type) == 0){
        return NSStringFromCGAffineTransform(*(CGAffineTransform *)valueRef);
    }
    
    // UIKit
    if (strcmp(@encode(UIEdgeInsets), type) == 0){
        return NSStringFromUIEdgeInsets(*(UIEdgeInsets *)valueRef);
    }
    
    if (strcmp(@encode(UIOffset), type) == 0){
        return NSStringFromUIOffset(*(UIOffset *)valueRef);
    }
    
    // BOOL
    if (strcmp(@encode(BOOL), type) == 0){
        if (strcmp(@encode(BOOL), @encode(signed char)) == 0){
            // 32 bit
            char ch = *(signed char *)valueRef;
            if ((char)YES == ch) return @"YES";
            if ((char)NO == ch) return @"NO";
        }else if (strcmp(@encode(BOOL), @encode(bool)) == 0){
            // 64 bit
            bool boolValue = *(bool *)valueRef;
            if (boolValue) {
                return @"YES";
            }else{
                return @"NO";
            }
        }
    }
    
    if (strcmp(@encode(bool), type) == 0){
        // 32 bit
        bool boolValue = *(bool *)valueRef;
        if (boolValue) {
            return @"true";
        }else{
            return @"false";
        }
    }
    
    // Primitives
    if (strcmp(@encode(void *), type) == 0){
        void *pointer = *(void **)valueRef;
        if (NULL == pointer) return @"(NULL)";
        return [NSString stringWithFormat:@"%p",pointer];
    }
    
    if (strcmp(@encode(double), type) == 0){
        return [NSString stringWithFormat:@"%f",*(double *)valueRef];
    }
    
    if (strcmp(@encode(float), type) == 0){
        return [NSString stringWithFormat:@"%f",*(float *)valueRef];
    }
    
    if (strcmp(@encode(int), type) == 0){
        return [NSString stringWithFormat:@"%d",*(int *)valueRef];
    }
    
    if (strcmp(@encode(short), type) == 0){
        return [NSString stringWithFormat:@"%d",*(short *)valueRef];
    }
    
    if (strcmp(@encode(long), type) == 0){
        return [NSString stringWithFormat:@"%ld",*(long *)valueRef];
    }
    
    if (strcmp(@encode(long long), type) == 0){
        return [NSString stringWithFormat:@"%lld",*(long long *)valueRef];
    }
    
    if (strcmp(@encode(signed char), type) == 0){
        char ch = *(char *)valueRef;
        return [NSString stringWithFormat:@"%c",ch];
    }
    
    if (strcmp(@encode(const char *), type) == 0){
        return [NSString stringWithFormat:@"%s",*(const char **)valueRef];
    }
    
    if (strcmp(@encode(unsigned char), type) == 0){
        return [NSString stringWithFormat:@"%c",*(unsigned char *)valueRef];
    }
    
    if (strcmp(@encode(unsigned int), type) == 0){
        return [NSString stringWithFormat:@"%u",*(unsigned int *)valueRef];
    }
    
    if (strcmp(@encode(unsigned short), type) == 0){
        return [NSString stringWithFormat:@"%u",*(unsigned short *)valueRef];
    }
    
    if (strcmp(@encode(unsigned long), type) == 0){
        return [NSString stringWithFormat:@"%lu",*(unsigned long *)valueRef];
    }
    
    if (strcmp(@encode(unsigned long long), type) == 0){
        return [NSString stringWithFormat:@"%llu",*(unsigned long long *)valueRef];
    }
    
    NSString *typeString = [NSString stringWithUTF8String:type];
    NSString *matchedType = nil;
    
    // C string literals
    if ((matchedType = typeMatch(typeString, @"^\\[([0-9_]+)c\\]$"))) {
        int num = [matchedType intValue];
        return [NSString stringWithFormat:@"%s", ((char (*)[num])valueRef)[0] ];
    }
    
    // Structure
    if ((matchedType = typeMatch(typeString, @"^\\{([A-Za-z0-9_]+)\\="))) {
        return [NSString stringWithFormat:@"{%@}",matchedType];
    }
    
    // Structure reference
    if ((matchedType = typeMatch(typeString, @"^\\^\\{([A-Za-z0-9_]+)\\="))) {
        return [NSString stringWithFormat:@"{%@: %p}",matchedType,*(void **)valueRef];
    }
    
    return [NSString stringWithFormat:@"ATSTRING_NOT_SUPPORTED_TYPE_(%s)", type];
}

@end
