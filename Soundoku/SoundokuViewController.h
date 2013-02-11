#import <UIKit/UIKit.h>

@interface SoundokuViewController : UIViewController<UICollectionViewDataSource>

//methods to override by subclasses
- (NSUInteger)numberOfSquares;

@end
