#import <UIKit/UIKit.h>
#import "SoundokuSquare.h"

@interface SoundCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) SoundokuSquare *square;

- (void)highlightSquare;
- (void)unhighlightSquare;

@end
