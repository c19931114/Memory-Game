//
//  GameViewController.m
//  ObjectiveC_practice
//
//  Created by Crystal on 2020/1/6.
//  Copyright © 2020 Crystal_In_The_House. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController () <UICollectionViewDataSource , UISearchControllerDelegate>

@property (nonatomic,strong) UIView *view1;

@property (nonatomic,strong) NSString *string1;

@property (nonatomic,assign) NSInteger int1;


//@property (nonatomic,assign) NSInteger number1;

@end

@implementation GameViewController

- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
    [self setUpConstraint];
    
//    self.view1.frame = CGRectZero;
//    UIView *view2 = _view1;
    self.view1.backgroundColor = [UIColor clearColor];

    
}

-(void) setUpConstraint{
    
//    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).with.offset(10);
//        make.top.equalTo(self.view).with.offset(10);
//        make.right.equalTo(self.view).with.offset(-10);
//        make.bottom.equalTo(self.view).with.offset(-10);
//    }];
    
        
}
- (void) initView {
    
    [self.view addSubview: self.view1];
//    [self.view setBackgroundColor: UIColor.whiteColor];
    self.view.backgroundColor = UIColor.whiteColor;
    
}

#pragma mark - 👉 UICollectionViewDataSource

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [UICollectionViewCell alloc];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}
-(void)dealloc{
    
}
#pragma mark - UI get and set

/*
 Yello View
 */
-(UIView *)view1{
    if (!_view1) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
        view.backgroundColor = [UIColor yellowColor];
        
        _view1 = view;
        
    }
    return _view1;
}

- (void)setString1:(NSString *)string1{

}

@end
