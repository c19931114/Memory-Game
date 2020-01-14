//
//  ViewController.m
//  ObjectiveC_practice
//
//  Created by Crystal on 2020/1/6.
//  Copyright © 2020 Crystal_In_The_House. All rights reserved.
//

#import "ViewController.h"
#import "GameViewController.h"

@interface ViewController ()

@property (nonatomic, assign) BOOL isTapAllowed;

@property (nonatomic,     ) UIView *view1;
@property (nonatomic,strong) NSString *string1;
@property (nonatomic,assign) NSInteger int1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupProperty];
    [self initView];
    
//    self.view1.frame = CGRectZero;
//    UIView *view2 = _view1;
    self.view1.backgroundColor = [UIColor clearColor];
    [self setUpConstraint];
}

- (void)setupProperty {
    self.isTapAllowed = YES;
    
}

- (void)initView {
    
    [self.myImageView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc]
         initWithTarget:self action:@selector(handleSingleTap:)];
    [self.myImageView addGestureRecognizer: singleFingerTap];
    self.startButton.hidden = YES;
    [self.startButton
     addTarget:self
     action:@selector(startButtonTapped)
     forControlEvents:UIControlEventTouchUpInside];
}

//The event handling method
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
//    NSLog(@"Hello World");
    
//    if (!self.isTapAllowed) { return; } // 加這行只能按一次
    
    self.isTapAllowed = !self.isTapAllowed;
 
    [self flipCard:self.isTapAllowed];

}

- (void)flipCard: (BOOL)isTapAllowed {
    
    UIViewAnimationOptions animationType = isTapAllowed ?
        UIViewAnimationOptionTransitionFlipFromRight : UIViewAnimationOptionTransitionFlipFromLeft;
    
    [UIView
     transitionWithView:_myImageView
     duration:.5
     options:animationType animations:^{
            
        NSLog(@"%lu", (unsigned long)animationType);
//        __weak typeof (self) weakSelf = self;
//        weakSelf.myImageView.image = [UIImage imageNamed:@"who_am_i"];
        self.myImageView.image = self.isTapAllowed ?
            [UIImage imageNamed:@"noImg"] : [UIImage imageNamed:@"who_am_i"];
                
    } completion:^(BOOL finished) {
    
        [UIView
         transitionWithView:self.startButton
         duration:.25
         options:UIViewAnimationOptionTransitionCrossDissolve
         animations:^{
            self.startButton.hidden = isTapAllowed;
        } completion:^(BOOL finished) {
            //
        }];
    }];
}

- (void)startButtonTapped {
    
//    GameViewController *gameViewController = [[GameViewController alloc] init];
    
    UIStoryboard *storyboard = [UIStoryboard
                                storyboardWithName:@"Main"
                                bundle:nil];
    
    GameViewController *gameViewController = [storyboard instantiateViewControllerWithIdentifier:@"GameViewController"];
//    gameViewController.row = 4;
    [self.navigationController pushViewController: gameViewController animated: YES];
}

-(void)setUpConstraint{
    
//    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).with.offset(10);
//        make.top.equalTo(self.view).with.offset(10);
//        make.right.equalTo(self.view).with.offset(-10);
//        make.bottom.equalTo(self.view).with.offset(-10);
//    }];
    
        
}

#pragma mark - UI Getter and Setter

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
