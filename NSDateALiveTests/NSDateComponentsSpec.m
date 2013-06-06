//
// Created by azu on 2013/06/06.
//


#import "Kiwi.h"
#import "NSDate+AZDateBuilder.h"
#import "NSDate+SinceADate.h"

@interface NSDateComponentsSpec : KWSpec

@end

@implementation NSDateComponentsSpec

+ (void)buildExampleGroups {
    describe(@"NSCalendar", ^{
        describe(@"#components:fromDate:toDate:options:", ^{
            context(@"`分`の差分が欲しい場合", ^{
                NSDate *currentDate = [NSDate date];
                NSDate *fromDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.hour : @9,
                    AZ_DateUnit.minute : @0,
                }];
                NSDate *toDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.hour : @10,
                    AZ_DateUnit.minute : @30,
                }];
                it(@"9:00から10:30の差である90を返す", ^{
                    NSInteger minute = [toDate minuteSinceADate:fromDate];
                    [[theValue(minute) should] equal:theValue(90)];
                });
            });
            context(@"`時間`の差分が欲しい場合", ^{
                NSDate *currentDate = [NSDate date];
                NSDate *fromDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.hour : @9,
                    AZ_DateUnit.minute : @0,
                }];
                NSDate *toDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.hour : @10,
                    AZ_DateUnit.minute : @30,
                }];
                it(@"9から10時までの差である1を返す", ^{
                    NSInteger hour = [toDate hourSinceADate:fromDate];
                    [[theValue(hour) should] equal:theValue(1)];
                });
            });
            context(@"`秒`の差分が欲しい場合", ^{
                NSDate *currentDate = [NSDate date];
                NSDate *fromDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.hour : @9,
                    AZ_DateUnit.minute : @0,
                    AZ_DateUnit.second : @0,
                }];
                NSDate *toDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.hour : @9,
                    AZ_DateUnit.minute : @10,
                    AZ_DateUnit.second : @0,
                }];
                it(@"10分=60*10を返す", ^{
                    NSInteger second = [toDate secondSinceADate:fromDate];
                    [[theValue(second) should] equal:theValue(60 * 10)];
                });
            });
        });
    });
}

@end