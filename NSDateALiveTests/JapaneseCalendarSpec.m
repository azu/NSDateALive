//
// Created by azu on 2013/06/06.
//


#import "Kiwi.h"
#import "NSDate+AZDateBuilder.h"

@interface JapaneseCalendarSpec : KWSpec

@end

@implementation JapaneseCalendarSpec

+ (void)buildExampleGroups {
    describe(@"JapaneseCalendar", ^{
        context(@"yyyy-MM-dd,", ^{
            // 2001-07-10を表すNSDateを返す
            NSDate *stubDate = [NSDate dateByUnit:@{
                AZ_DateUnit.year : @2001,
                AZ_DateUnit.month : @7,
                AZ_DateUnit.day : @10
            }];
            context(@"デフォルトのNSDateformaterを使う場合", ^{
                // => gregorian以外のカレンダーでは失敗する
                it(@"yyyyは西暦で出力されることを期待するが…", ^{
                    NSString *expectDateString = @"2001-07-10";
                    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                    NSString *result = [dateFormatter stringFromDate:stubDate];
                    [[result should] equal:expectDateString];
                });
            });
            context(@"Calendarを設定したNSDateformaterを使う場合", ^{
                // => gregorian以外のカレンダーでは失敗する
                it(@"yyyyは常に西暦で出力される", ^{
                    NSString *expectDateString = @"2001-07-10";
                    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                    // gregorianのカレンダーを設定
                    [dateFormatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
                    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                    NSString *result = [dateFormatter stringFromDate:stubDate];
                    [[result should] equal:expectDateString];
                });
            });
        });
    });
}

@end