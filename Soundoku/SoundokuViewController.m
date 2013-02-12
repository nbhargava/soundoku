#import "SoundokuViewController.h"
#import "SoundCollectionViewCell.h"
#import "SoundokuGame.h"
#import "SoundokuLevels.h"

@interface SoundokuViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) SoundokuGame *game;
@property (weak, nonatomic) IBOutlet UIView *noteSelectionView;
@property (strong, nonatomic) SoundCollectionViewCell *selectedCell;
@property NSUInteger selectedIndex;

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
        if (self.selectedCell) {
            [self.selectedCell unhighlightSquare];
        }
        
        SoundokuSquare *square = [self.game squareAtIndex:indexPath.row];
        [self playSoundForSquare:square];
        self.noteSelectionView.hidden = (square.status == BLACK);
        
        self.selectedCell = (SoundCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        [self.selectedCell highlightSquare];
        self.selectedIndex = indexPath.row;
        
        self.selectedCell.square = square;
    }
}

- (IBAction)assignValue:(id)sender
{
    [self.game setSquareAt:self.selectedIndex withValue:[sender tag]];
    self.selectedCell.square = [self.game squareAtIndex:self.selectedIndex];
    [self playSoundForSquare:self.selectedCell.square];
}

#pragma mark - Helpers

- (void)playSoundForSquare:(SoundokuSquare *)square
{
    NSLog(@"%d", square.value);
}



@end
