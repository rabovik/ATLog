//
//  ATStringTests.m
//  ATLog
//
//  Created by Yan Rabovik on 20.08.13.
//
//

#import <SenTestingKit/SenTestingKit.h>

@interface ATStringTests : SenTestCase @end

#import "ATString.h"

#define AssertEquals(A,B) STAssertTrue([A isEqualToString:(B)], @"%@",A)
#define SF(FORMAT...) [NSString stringWithFormat:FORMAT]

@implementation ATStringTests

-(void)testFoundation{
    AssertEquals(ATString((id)nil), @"(nil)");
    
    NSObject *object = [NSObject new];
    AssertEquals(ATString(object), SF(@"%@",object));
    
    AssertEquals(ATString(self), SF(@"%@",self));
    
    AssertEquals(ATString([NSObject class]), NSStringFromClass([NSObject class]));
    
    Protocol *protocol = @protocol(NSCopying);
    AssertEquals(ATString(protocol), NSStringFromProtocol(protocol));

    SEL selector = @selector(testFoundation);
    AssertEquals(ATString(selector), NSStringFromSelector(selector));
    
    NSRange range = NSMakeRange(15, 3);
    AssertEquals(ATString(range), NSStringFromRange(range));
}

-(void)testUIKit{
    UIOffset offset = UIOffsetMake(100.5, 100.5);
    AssertEquals(ATString(offset),NSStringFromUIOffset(offset));
    
    UIEdgeInsets insets = UIEdgeInsetsMake(5, 5, 5, 5);
    AssertEquals(ATString(insets), NSStringFromUIEdgeInsets(insets));
}

-(void)testCoreGraphics{
    CGRect rect = CGRectMake(10, 20, 30, 40);
    AssertEquals(ATString(rect), NSStringFromCGRect(rect));
    
    CGPoint point = CGPointMake(100, 200);
    AssertEquals(ATString(point), NSStringFromCGPoint(point));
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    AssertEquals(ATString(transform), NSStringFromCGAffineTransform(transform));
    
    CGSize size = CGSizeMake(150, 150);
    AssertEquals(ATString(size), NSStringFromCGSize(size));    
}

-(void)testPrimitives{
    AssertEquals(ATString((char)'A'), SF(@"%c",'A'));

    AssertEquals(ATString(YES), @"YES");
    AssertEquals(ATString(NO), @"NO");
    
    AssertEquals(ATString(3.14), SF(@"%f",3.14));
    AssertEquals(ATString(3.14f), SF(@"%f",3.14));
    
    AssertEquals(ATString(13), SF(@"%d",13));
    AssertEquals(ATString((short)13), SF(@"%d",13));
    AssertEquals(ATString((long)LONG_MAX), SF(@"%ld",LONG_MAX));
    AssertEquals(ATString((long long)LLONG_MAX), SF(@"%lld",LLONG_MAX));
    
    AssertEquals(ATString((unsigned char)'c'), SF(@"%c",'c'));

    AssertEquals(ATString((unsigned int)13), SF(@"%u",13u));
    AssertEquals(ATString((unsigned short)13), SF(@"%u",13u));
    AssertEquals(ATString((unsigned long)ULONG_MAX), SF(@"%lu",ULONG_MAX));
    AssertEquals(ATString((unsigned long long)ULLONG_MAX), SF(@"%llu",ULLONG_MAX));
    
#if !defined(OBJC_HIDE_64) && TARGET_OS_IPHONE && __LP64__
    // 64 bit
    AssertEquals(ATString((bool)true), @"YES");
    AssertEquals(ATString((bool)false), @"NO");
    AssertEquals(ATString((bool)2), @"YES");
#else
    // 32 bit
    AssertEquals(ATString((bool)true), @"true");
    AssertEquals(ATString((bool)false), @"false");
    AssertEquals(ATString((bool)2), @"true");
#endif
    
    AssertEquals(ATString(NULL), @"(NULL)");
}

-(void)testStrings{
    AssertEquals(ATString((const char *)"ABC"), @"ABC");
    AssertEquals(ATString("QWERTY"), @"QWERTY");
}

-(void)testStructures{
    struct MyStruct {
        CGFloat f;
    };
    
    typedef struct MyStruct *MyStructRef;
    
    struct MyStruct m = {M_PI};
    MyStructRef mRef = &m;
    
    AssertEquals(ATString(m), @"{MyStruct}");
    AssertEquals(ATString(mRef), SF(@"{MyStruct: %p}",mRef));
}

@end
