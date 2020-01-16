//
//  GameViewController.m
//  ObjectiveC_practice
//
//  Created by Crystal on 2020/1/6.
//  Copyright © 2020 Crystal_In_The_House. All rights reserved.
//

#import "GameViewController.h"
#import "CardCell.h"

@interface GameViewController () <UICollectionViewDataSource , UICollectionViewDelegateFlowLayout>
{
    NSArray *imageNames;
    NSMutableArray *pickedNames;
//    int row;
    CGSize fullScreenSize;
    NSString *chosenImageName;
    NSIndexPath *firstIndexPath;
    NSIndexPath *secondIndexPath;
}
@property (strong, nonatomic) NSString *content;
@property (nonatomic, getter=isChoosing) BOOL choosing;
@property (nonatomic, getter=isMatched) BOOL matched; //沒用到
//@property (nonatomic) CGSize fullScreenSize;

//@property (nonatomic,assign) NSInteger number1;

@end

@implementation GameViewController

@synthesize choosing = _choosing;
@synthesize matched = _matched;

- (void)loadView {
    [super loadView];
//    row = 3;
//    fullScreenSize = UIScreen.mainScreen.bounds.size;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupParams];
    [self initView];
    [self setupCollectionView];

//    NSLog(@"%@", self.content);
//    NSLog(self.chosen ? @"YES" : @"NO");
//    NSLog(self.matched ? @"YES" : @"NO");
}

- (void)setupParams {

    //initialize and set then ready to accept elements
//    pickedNames = [[NSMutableArray alloc] init];
    self.row = 4; // 只能偶數
    fullScreenSize = UIScreen.mainScreen.bounds.size;
    imageNames = [NSMutableArray new];
    pickedNames = [NSMutableArray new];//[[NSMutableArray alloc] initWithArray:@[@"first"]];
    [self setupPickedImages];

}

- (void)setupPickedImages {

    imageNames = [[NSArray alloc] initWithObjects:

                  @"1-animal-dog-pet-sad.jpg",
                  @"0207-1.jpg",
                  @"18015021.jpg",
                  @"c37e471cbda190a9c8cce3892d3fda26.jpg",
                  @"charlie_1_20160614_1804687380.jpg",
                  @"ciwHbm-L.jpg",
                  @"colour_blocks.jpg",
                  @"dream-image.jpg",
                  @"Image Essentials Stetson.jpg",
                  @"image-3-512x512.jpg",
                  @"image.jpg",
                  @"cropped-image-17.jpg",
                  @"peppers.png",
                  @"on_the_phone.jpg",
                  @"texture.jpg",
                  @"Superdomo-la-rioja-image.jpg",
                  @"Snapshot _ Roby  Coccy  IRDS 123 224 22 - Adulti.png",
                  @"Lichtenstein_img_processing_test.png",
                  @"Snapshot _ Roby  Coccy  IRDS 101 180 22 - Adulti.png",
                  @"Superdomo-la-rioja-image.jpg",
                  nil];

    int remaining = (self.row * self.row) / 2;
    if (imageNames.count >= remaining) {
        while (remaining > 0) {

            NSUInteger randomIndex = arc4random() % imageNames.count;
            NSString *imageName = imageNames[randomIndex];
            NSLog(@"%@, %lu", @"randomIndex",(unsigned long)randomIndex);
            if (![pickedNames containsObject:imageName]) {
                [pickedNames addObject:imageName];
                remaining--;
            }
        }
    }

    [pickedNames addObjectsFromArray:pickedNames];

    for (int i = 0; i < pickedNames.count; i++) {
        int nElements = (int)pickedNames.count - i;
        int n = (arc4random() % nElements) + i;
        [pickedNames exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    NSLog(@"%@, %@", @"pickedNames2:",pickedNames);

}

- (void)initView {
    
//    [self.view setBackgroundColor: UIColor.whiteColor];
//    self.view.backgroundColor = UIColor.whiteColor;

}

- (void)setupCollectionView {
    
    [self.myCollectionView
     registerNib:[UINib nibWithNibName:@"CardCell" bundle:nil]
     forCellWithReuseIdentifier:@"CardCell"];
    
//    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout alloc];
//    [layout setMinimumLineSpacing: 10];
    
    
    self.myCollectionView.dataSource = self;
    self.myCollectionView.delegate = self;
}

-(void)dealloc{
    
}

#pragma mark - 👉 UICollectionViewDataSource

- (NSInteger)collectionView:
(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {

    int count = self.row * self.row;
    //    NSLog(@"%d", count);
    return count;
}


/*
 func collectionView(
 _ collectionView: UICollectionView,
 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
*/
- (nonnull __kindof UICollectionViewCell *)collectionView:
    (nonnull UICollectionView *)collectionView
    cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {

//    UIImage *image = [UIImage imageNamed:@"%@", imageNames[indexPath.row]];
//    NSLog(@"%@", imageNames[indexPath.row]);
    CardCell *cell = [collectionView
                      dequeueReusableCellWithReuseIdentifier:@"CardCell"
                      forIndexPath:indexPath];

    NSString *imageName = pickedNames[indexPath.row];
    cell.imageName = imageName;
//    [cell setImageName:imageName];

//    [cell setFlipppppp:^MatchStatus(NSString * _Nonnull cardName) {
//        NSLog(@"%@, %@", @"cardName", cardName);
//        __weak typeof (self) weakSelf = self;
//
//        if (self.chosen) {
//            // choose seconcd card
//            self.chosen = false;
//
//            if (self->chosenImageName == cardName) {
//                // is matched
//                return isMatched;
//
//            } else {
//                // not matched
//                return unMatched;
//            }
//
//        } else {
//            // choose first card
//            weakSelf.chosen = true;
//            self->chosenImageName = cardName;
//            return choosing;
//        }
//    }];

    return cell;
}

#pragma mark - 👉 UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSString *imageName = pickedNames[indexPath.row];
    if (indexPath == firstIndexPath) { return; }
    if (self.choosing) {
        // choose seconcd card
        self.choosing = false;

        secondIndexPath = indexPath;
        CardCell *firstCell = (CardCell *)[collectionView cellForItemAtIndexPath:self->firstIndexPath];
        CardCell *secondCell = (CardCell *)[collectionView cellForItemAtIndexPath:self->secondIndexPath];
        [secondCell flipCard:YES];

        if (chosenImageName == imageName) {
            // is matched
          
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                NSLog(@"Do some work");
                [firstCell dismiss];
                firstCell.userInteractionEnabled = NO;
                [secondCell dismiss];
                secondCell.userInteractionEnabled = NO;
            });

        } else {
            // not matched

            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                NSLog(@"Do some work");
                [firstCell flipCard:NO];
                [secondCell flipCard:NO];
            });
        }
        chosenImageName = @"";

    } else {
        // choose first card
        self.choosing = true;
        chosenImageName = imageName;

        firstIndexPath = indexPath;
        CardCell *firstCell = (CardCell *)[collectionView cellForItemAtIndexPath:firstIndexPath];
        [firstCell flipCard:YES];
    }
}

- (void)flipCard: (BOOL)isTapAllowed cardCell:(CardCell *)cell {

    UIViewAnimationOptions animationType = isTapAllowed ?
    UIViewAnimationOptionTransitionFlipFromRight : UIViewAnimationOptionTransitionFlipFromLeft;

    [UIView
     transitionWithView:cell.imageView
     duration:.5
     options:animationType animations:^{

//         NSLog(@"%lu", (unsigned long)animationType);
         //        __weak typeof (self) weakSelf = self;
         //        weakSelf.myImageView.image = [UIImage imageNamed:@"who_am_i"];
         cell.imageView.image = isTapAllowed ?
         [UIImage imageNamed:@"noImg"] : [UIImage imageNamed:@"who_am_i"];

     } completion:^(BOOL finished) {

//         [UIView
//          transitionWithView:self.startButton
//          duration:.25
//          options:UIViewAnimationOptionTransitionCrossDissolve
//          animations:^{
//              self.startButton.hidden = isTapAllowed;
//          } completion:^(BOOL finished) {
//              //
//          }];
     }];
}


#pragma mark - 👉 UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:
    (UICollectionView *)collectionView
    layout:(UICollectionViewLayout *)collectionViewLayout
    sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    CGFloat width = collectionView.bounds.size.width / (self.row * 2 - 1);
    CGFloat width = (collectionView.bounds.size.width - (self.row - 1) * 10) / self.row;
//    NSLog(@"%@, %f", @"👉 sizeForItemAtIndexPath", width);
    return CGSizeMake(width, width);
}

- (CGFloat)collectionView:
    (UICollectionView *)collectionView
    layout:(UICollectionViewLayout *)collectionViewLayout
    minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    CGFloat width = collectionView.bounds.size.width / (self.row * 2 - 1);
//    NSLog(@"%@, %f", @"👉 minimumInteritemSpacingForSectionAtIndex", width);
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
    layout:(UICollectionViewLayout *)collectionViewLayout
    minimumLineSpacingForSectionAtIndex:(NSInteger)section {

    CGFloat width = collectionView.bounds.size.width / (self.row * 2 - 1);
//    NSLog(@"%@, %f", @"👉 minimumLineSpacingForSectionAtIndex", width);
    return 10;
}

#pragma mark - Getter and Setter
/*
 @property (nonatomic, assign) BOOL chosen; // 自動建好 Getter 和 Setter 如下
- (BOOL)chosen {
    return _chosen;
}
- (void)setChosen:(BOOL)chosen {
    _chosen = chosen;
}
*/

// 有改名也是自動建好
- (BOOL)isChoosing {
    return _choosing;
}

- (void)setChoosing:(BOOL)choosing {
    _choosing = choosing;
}

- (BOOL)isMatched {
    return _matched;
}

- (void)setMatched:(BOOL)matched {
    _matched = matched;
}


@end
