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
}
@property (strong, nonatomic) NSString *content;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;
//@property (nonatomic) CGSize fullScreenSize;

//@property (nonatomic,assign) NSInteger number1;

@end

@implementation GameViewController

@synthesize chosen = _chosen;
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

    NSLog(@"%@", self.content);
    NSLog(self.chosen ? @"YES" : @"NO");
    NSLog(self.matched ? @"YES" : @"NO");
}

- (void)setupParams {

    //initialize and set then ready to accept elements
//    pickedNames = [[NSMutableArray alloc] init];
    self.row = 6;
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

    NSString *imageName = pickedNames[indexPath.row];
    UIImage *image = [UIImage imageNamed: imageName];
//    UIImage *image = [UIImage imageNamed:@"%@", imageNames[indexPath.row]];
//    NSLog(@"%@", imageNames[indexPath.row]);
    CardCell *cell = [collectionView
                        dequeueReusableCellWithReuseIdentifier:@"CardCell"
                        forIndexPath:indexPath];
    cell.layer.cornerRadius = 5;//cell.bounds.size.height / 2;
    cell.layer.borderColor = UIColor.whiteColor.CGColor;
    cell.layer.borderWidth = 3;
    cell.imageview.image = image;
//    [UIImage imageNamed:@"who_am_i"];
    return cell;
}










#pragma mark - 👉 UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSString *imageName = pickedNames[indexPath.row];

    if (self.chosen) {
        // choose seconcd card
        self.chosen = false;

        if (chosenImageName == imageName) {
            // is matched
        } else {
            // not matched
        }

    } else {
        // choose first card
        self.chosen = true;
        chosenImageName = imageName;
    }

    if (self.matched) {

    }

}

#pragma mark - 👉 UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:
    (UICollectionView *)collectionView
    layout:(UICollectionViewLayout *)collectionViewLayout
    sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = collectionView.bounds.size.width / (self.row * 2 - 1);
//    NSLog(@"%@, %f", @"👉 sizeForItemAtIndexPath", width);
    return CGSizeMake(width, width);
}

- (CGFloat)collectionView:
    (UICollectionView *)collectionView
    layout:(UICollectionViewLayout *)collectionViewLayout
    minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    CGFloat width = collectionView.bounds.size.width / (self.row * 2 - 1);
//    NSLog(@"%@, %f", @"👉 minimumInteritemSpacingForSectionAtIndex", width);
    return width;
}

- (CGFloat)collectionView:(UICollectionView *)
    collectionView layout:(UICollectionViewLayout *)collectionViewLayout
    minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    CGFloat width = collectionView.bounds.size.width / (self.row * 2 - 1);
//    NSLog(@"%@, %f", @"👉 minimumLineSpacingForSectionAtIndex", width);
    return width;
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

// 改名也是自動建好
- (BOOL)isChosen {
    return _chosen;
}

- (void)setChosen:(BOOL)chosen {
    _chosen = chosen;
}

- (BOOL)isMatched {
    return _matched;
}

- (void)setMatched:(BOOL)matched {
    _matched = matched;
}


@end
