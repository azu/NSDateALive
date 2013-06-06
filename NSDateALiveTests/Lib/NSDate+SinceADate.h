//
// Created by azu on 2013/06/06.
//


#import <Foundation/Foundation.h>

@interface NSDate (SinceADate)

- (NSInteger)hourSinceADate:(NSDate *) fromDate;

- (NSInteger)minuteSinceADate:(NSDate *) fromDate;

- (NSInteger)secondSinceADate:(NSDate *) fromDate;
@end