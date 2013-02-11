#import "SoundokuGame.h"

@interface SoundokuGame()

@property (strong, nonatomic) NSMutableArray *squares; //of SoundokuSquare
@property (strong, nonatomic) NSArray *solutionSquares; //of values

@end

@implementation SoundokuGame

- (id)initWithInitialSetting:(NSArray *)initialSquares
                   solution:(NSArray *)solutionSquares
{
    self = [super init];
    if (self) {
        _squares = [self parseSquares:initialSquares];
        _solutionSquares = solutionSquares;
    }
    return self;
}

- (void)setSquareAt:(NSUInteger)index
         withValue:(NSUInteger)value
{
    SoundokuSquare *square = self.squares[index];
    if (square.status == WHITE || square.status == GREY) {
        square.value = value;
        square.status = GREY;
    }
    
    //compare to solution to see if the game is won
}

-(SoundokuSquare *)squareAtIndex:(NSUInteger)index
{
    return self.squares[index];
}

#pragma mark - Helpers

- (NSMutableArray *)parseSquares:(NSArray *)initialSquares {
    NSMutableArray *squares = [[NSMutableArray alloc] init];
    for (NSNumber *number in initialSquares) {
        SoundokuSquare *square = [[SoundokuSquare alloc] init];
        NSInteger squareValue = [number intValue];
        if (squareValue < 0) {
            square.status = WHITE;
        } else {
            square.status = BLACK;
            square.value = squareValue;
        }
        [squares addObject:square];
    }
    return squares;
}

@end
