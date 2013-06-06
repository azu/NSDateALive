//
// Created by azu on 2013/06/06.
//


#import "NSDate+SinceADate.h"


@implementation NSDate (SinceADate)

- (NSInteger)hourSinceADate:(NSDate *) fromDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar
        components:NSHourCalendarUnit fromDate:fromDate toDate:self options:0];
    return [dateComponents hour];
}

- (NSInteger)minuteSinceADate:(NSDate *) fromDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar
        components:NSMinuteCalendarUnit fromDate:fromDate toDate:self options:0];
    return [dateComponents minute];
}

- (NSInteger)secondSinceADate:(NSDate *) fromDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar
        components:NSSecondCalendarUnit fromDate:fromDate toDate:self options:0];
    return [dateComponents second];
}


@end