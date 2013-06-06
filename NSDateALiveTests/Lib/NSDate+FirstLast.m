//
// Created by azu on 2013/06/06.
//


#import "NSDate+FirstLast.h"


@implementation NSDate (FirstLast)
- (NSInteger)firstDayOfMonth {
    NSCalendar *cal = [NSCalendar currentCalendar];
    // inUnit:で指定した単位（月）の中で、rangeOfUnit:で指定した単位（日）が取り得る範囲
    NSRange range = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    NSInteger firstDayValue = range.location;
    return firstDayValue;
}

- (NSInteger)lastDayOfMonth {
    NSCalendar *cal = [NSCalendar currentCalendar];
    // inUnit:で指定した単位（月）の中で、rangeOfUnit:で指定した単位（日）が取り得る範囲
    NSRange range = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    NSInteger lastDayValue = range.length;
    return lastDayValue;

}


@end