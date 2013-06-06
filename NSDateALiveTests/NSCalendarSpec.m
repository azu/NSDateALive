//
// Created by azu on 2013/06/06.
//


#import "Kiwi.h"
#import "NSDate+AZDateBuilder.h"
#import "NSDate+FirstLast.h"

@interface NSCalendarSpec : KWSpec

@end

@implementation NSCalendarSpec

+ (void)buildExampleGroups {
    describe(@"#firstDayOfMonth", ^{
        context(@"2013年6月", ^{
            NSDate *targetDate = [NSDate dateByUnit:@{
                AZ_DateUnit.year : @2013,
                AZ_DateUnit.month : @6
            }];
            beforeEach(^{
                // Calendarによって日付が異なるかもしれないので日本の話しにする
                NSCalendar *jaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSJapaneseCalendar];
                [NSCalendar stub:@selector(currentCalendar) andReturn:jaCalendar];
            });
            it(@"月初は 1 ", ^{
                NSInteger firstDayOfMonth = [targetDate firstDayOfMonth];
                [[theValue(firstDayOfMonth) should] equal:theValue(1)];
            });
        });
    });
    describe(@"#lastDayOfMonth", ^{
        context(@"2013年6月", ^{
            NSDate *targetDate = [NSDate dateByUnit:@{
                AZ_DateUnit.year : @2013,
                AZ_DateUnit.month : @6
            }];
            beforeEach(^{
                // Calendarによって日付が異なるかもしれないので
                NSCalendar *jaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSJapaneseCalendar];
                [NSCalendar stub:@selector(currentCalendar) andReturn:jaCalendar];
            });
            it(@"月末は 30", ^{
                NSInteger lastDayOfMonth = [targetDate lastDayOfMonth];
                [[theValue(lastDayOfMonth) should] equal:theValue(30)];
            });
        });
    });
}

@end