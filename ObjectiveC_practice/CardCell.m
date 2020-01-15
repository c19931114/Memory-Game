//
//  CardCell.m
//  ObjectiveC_practice
//
//  Created by Crystal on 2020/1/8.
//  Copyright © 2020 Crystal_In_The_House. All rights reserved.
//

#import "CardCell.h"

@implementation CardCell

/*
 - (void)setImage:(UIImage*)image {
 _image = image;
 photoLayer.contents = image.CGImage
 }
 */

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
//    self.imageName = imageName;
//    self.imageView.image = [UIImage imageNamed: imageName];

}


- (void)awakeFromNib {
    [super awakeFromNib];

    self.layer.cornerRadius = 5;//cell.bounds.size.height / 2;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.borderWidth = 3;

//    [self.imageView setUserInteractionEnabled:YES];
//    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc]
//                                               initWithTarget:self action:@selector(handleSingleTap:)];
//    [self.imageView addGestureRecognizer: singleFingerTap];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
        NSLog(@"Hello World");

    if (self.isChosen) { return; } // 加這行只能按一次

    self.isChosen = !self.isChosen;

    [self flipCard:self.isChosen];

//    MatchStatus matchStatus = self.flipppppp(self.imageName);
//    switch (matchStatus) {
//        case choosing:
//            [self flipCard:self.isChosen];
//            break;
//        case isMatched:
//            [self flipCard:self.isChosen];
//            break;
//        case unMatched:
//            [self flipCard:self.isChosen];
//            break;
//        default:
//            break;
//    }
}

- (void)flipCard: (BOOL)isTapAllowed {

    UIViewAnimationOptions animationType = isTapAllowed ?
        UIViewAnimationOptionTransitionFlipFromRight : UIViewAnimationOptionTransitionFlipFromLeft;

    [UIView
     transitionWithView:self.imageView
     duration:.2
     options:animationType animations:^{

         NSLog(@"%lu", (unsigned long)animationType);
         //        __weak typeof (self) weakSelf = self;
         //        weakSelf.myImageView.image = [UIImage imageNamed:@"who_am_i"];
         self.imageView.image = isTapAllowed ?
         [UIImage imageNamed:self.imageName] : [UIImage imageNamed:@"noImg"];

     } completion:^(BOOL finished) {
     }];
}

//- (void)dismiss

@end
