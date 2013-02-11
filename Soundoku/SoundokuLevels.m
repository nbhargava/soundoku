#import "SoundokuLevels.h"

@implementation SoundokuLevels

+(NSArray *)easyLevelInitial
{
    //-1 for empty, order is row1 then row2 etc
    return @[@2,@4,@(-1),@(-1),
    @(-1),@(3),@(-1),@(-1),
    @(-1),@(-1),@(1),@(-1),
    @(-1),@(-1), @(2),@(4)];
}

+(NSArray *)easyLevelSolution
{
    return nil;
}

+(NSArray *)hardLevelInitial
{
    return nil;
}

+(NSArray *)hardLevelSolution
{
    return nil;
}

@end
