#import <Foundation/Foundation.h>
#import "SoundokuSquare.h"

@interface SoundokuGame : NSObject

@property (nonatomic) BOOL gameWon;

- (id)initWithInitialSetting:(NSArray *)initialSquares
                   solution:(NSArray *)solutionSquares;

- (void)setSquareAt:(NSUInteger)index
         withValue:(NSUInteger)value;

- (SoundokuSquare *)squareAtIndex:(NSUInteger)index;

@end
