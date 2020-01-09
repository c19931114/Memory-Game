//
//  GameViewController.m
//  ObjectiveC_practice
//
//  Created by Crystal on 2020/1/6.
//  Copyright © 2020 Crystal_In_The_House. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController () <UICollectionViewDataSource , UISearchControllerDelegate>

@property (strong, nonatomic) NSString *content;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;


//@property (nonatomic,assign) NSInteger number1;

@end

@implementation GameViewController

@synthesize chosen = _chosen;
@synthesize matched = _matched;



- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
    
}

- (void)initView {
    
//    [self.view addSubview: self.view1];
//    [self.view setBackgroundColor: UIColor.whiteColor];
    self.view.backgroundColor = UIColor.whiteColor;
    
}

- (void)setupCollectionView {
    self.myCollectionView.dataSource = self;
    
}

#pragma mark - 👉 UICollectionViewDataSource
/*
 func collectionView(
 _ collectionView: UICollectionView,
 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
*/
- (nonnull __kindof UICollectionViewCell *)
    collectionView: (nonnull UICollectionView *)collectionView
    cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
//    UICollectionViewCell *myCollectionViewCell =
    return [UICollectionViewCell alloc];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

-(void)dealloc{
    
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
