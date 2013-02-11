#import "SoundCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation SoundCollectionViewCell

- (void)setup
{
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 2.0f;
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setSquare:(SoundokuSquare *)square
{
    _square = square;
    switch (square.status) {
        case BLACK:
            self.backgroundColor = [UIColor blackColor];
            break;
        case GREY:
            self.backgroundColor = [UIColor lightGrayColor];
            break;
        case WHITE:
            self.backgroundColor = [UIColor whiteColor];
            break;
        default:
            break;
    }
    [self setNeedsDisplay];
}

@end
