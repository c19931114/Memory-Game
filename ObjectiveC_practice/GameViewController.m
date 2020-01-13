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
    NSArray *images;
//    int row;
    CGSize fullScreenSize;
    
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

    self.row = 3;
    fullScreenSize = UIScreen.mainScreen.bounds.size;
    images = [[NSArray alloc] initWithObjects:

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
               @"Snapshot _ Roby  Coccy  IRDS 123 224 22 - Adulti",
               @"Superdomo-la-rioja-image.jpg",
               @"texture.jpg"

               ,nil];
    
}

- (void)initView {
    
//    [self.view setBackgroundColor: UIColor.whiteColor];
    self.view.backgroundColor = UIColor.whiteColor;
    
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
/*
 func collectionView(
 _ collectionView: UICollectionView,
 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
*/
- (nonnull __kindof UICollectionViewCell *)collectionView:
    (nonnull UICollectionView *)collectionView
    cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    CardCell *cell = [collectionView
                        dequeueReusableCellWithReuseIdentifier:@"CardCell"
                        forIndexPath:indexPath];
    cell.layer.cornerRadius = cell.bounds.size.height / 2;
    cell.layer.borderColor = UIColor.blueColor.CGColor;
    cell.layer.borderWidth = 3;
    return cell;
}

- (NSInteger)collectionView:
    (nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.row * self.row;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:
    (UICollectionView *)collectionView
    layout:(UICollectionViewLayout *)collectionViewLayout
    sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = collectionView.bounds.size.width / (self.row * 2 - 1);
    NSLog(@"%@, %f", @"aaa sizeForItemAtIndexPath", width);
    return CGSizeMake(width, width);
}

- (CGFloat)collectionView:
    (UICollectionView *)collectionView
    layout:(UICollectionViewLayout *)collectionViewLayout
    minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    CGFloat width = collectionView.bounds.size.width / (self.row * 2 - 1);
    NSLog(@"%@, %f", @"aaa minimumInteritemSpacingForSectionAtIndex", width);
    return width;
}

- (CGFloat)collectionView:(UICollectionView *)
    collectionView layout:(UICollectionViewLayout *)collectionViewLayout
    minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    CGFloat width = collectionView.bounds.size.width / (self.row * 2 - 1);
    NSLog(@"%@, %f", @"aaa minimumLineSpacingForSectionAtIndex", width);
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
