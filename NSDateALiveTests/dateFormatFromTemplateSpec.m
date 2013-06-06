//
// Created by azu on 2013/06/06.
//


#import "Kiwi.h"

@interface dateFormatFromTemplateSpec : KWSpec

@end

@implementation dateFormatFromTemplateSpec

+ (void)buildExampleGroups {
    describe(@"NSDateFormatter", ^{
        describe(@"#dateFormatFromTemplate", ^{
            context(@"When lang is english", ^{
                beforeEach(^{
                    NSLocale *english = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
                    [NSLocale stub:@selector(currentLocale) andReturn:english];
                });
                it(@"return MM/dd(EEE)", ^{
                    NSString *format = [NSDateFormatter dateFormatFromTemplate:@"EdMMM" options:0 locale:[NSLocale currentLocale]];
                    [[format should] equal:@"EEE, MMM d"];
                    // en_US => Thu, Jun 6
                });
            });
            context(@"When lang is japanese", ^{
                beforeEach(^{
                    NSLocale *japanese = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
                    [NSLocale stub:@selector(currentLocale) andReturn:japanese];
                });
                it(@"return MM/dd(EEE)", ^{
                    NSString *format = [NSDateFormatter dateFormatFromTemplate:@"EdMMM" options:0 locale:[NSLocale currentLocale]];
                    [[format should] equal:@"M月d日(EEE)"];
                    // ja_JP => 6月6日(木)
                });
            });
        });
    });
}


@end