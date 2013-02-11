#import <Foundation/Foundation.h>

@interface SoundokuSquare : NSObject

typedef enum {
    BLACK = 0,
    GREY,
    WHITE
} CellStatus;

@property (nonatomic) NSUInteger value; //can be 1 to 4 in easy, 1 to 6 in hard mode
@property (nonatomic) CellStatus status;

@end
