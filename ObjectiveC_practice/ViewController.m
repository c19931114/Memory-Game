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

@property (nonatomic, assign) BOOL isTapEnd;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
}

- (void)initView {
    
    [self.myImageView setUserInteractionEnabled: YES];
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc]
         initWithTarget:self action:@selector(handleSingleTap:)];
    [self.myImageView addGestureRecognizer: singleFingerTap];
}

//The event handling method
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    NSLog(@"Hello World");
    
    [UIView
     transitionWithView:_myImageView
     duration:.75
     options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
//        __weak typeof (self) weakSelf = self;
//        weakSelf.myImageView.image = [UIImage imageNamed:@"who_am_i"];
        self.myImageView.image = [UIImage imageNamed:@"who_am_i"];
        
    } completion:^(BOOL finished) {
        //
    }];
    
//    GameViewController *gameViewController = [[GameViewController alloc] init];
//    [self.navigationController pushViewController: gameViewController animated: YES];
}

@end
