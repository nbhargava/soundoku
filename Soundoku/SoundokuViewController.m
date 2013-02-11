#import "SoundokuViewController.h"
#import "SoundCollectionViewCell.h"
#import "SoundokuGame.h"
#import "SoundokuLevels.h"

@interface SoundokuViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) SoundokuGame *game;
@property (weak, nonatomic) IBOutlet UIView *noteSelectionView;

@end

@implementation SoundokuViewController

#pragma mark - Subclassables

- (NSUInteger)numberOfSquares
{
    return 16;
}

#pragma mark - Lazy instantiation

- (SoundokuGame *)game {
    if (!_game) _game = [[SoundokuGame alloc] initWithInitialSetting:[SoundokuLevels easyLevelInitial] solution:[SoundokuLevels easyLevelSolution]];
    return _game;
}

#pragma mark - View Controller lifecycle

- (void)viewDidLoad
{
    self.noteSelectionView.hidden = YES;
}


#pragma mark - UICollectionViewDataSource methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.numberOfSquares;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SoundCell" forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[SoundCollectionViewCell class]]) {
        SoundCollectionViewCell *soundCell = (SoundCollectionViewCell *)cell;
        SoundokuSquare *square = [self.game squareAtIndex:indexPath.row];
        soundCell.square = square;
    }
    
    return cell;
}

#pragma mark - Actions, Gestures

- (IBAction)tapSquare:(UITapGestureRecognizer *)gesture {
    CGPoint tapLocation = [gesture locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:tapLocation];
    
    if (indexPath) {
        SoundokuSquare *square = [self.game squareAtIndex:indexPath.row];
        [self playSoundForSquare:square];
        self.noteSelectionView.hidden = (square.status == BLACK);
    }
}

#pragma mark - Helpers

- (void)playSoundForSquare:(SoundokuSquare *)square
{
    
}

@end
