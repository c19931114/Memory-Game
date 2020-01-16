//
//  CardCell.m
//  ObjectiveC_practice
//
//  Created by Crystal on 2020/1/8.
//  Copyright © 2020 Crystal_In_The_House. All rights reserved.
//

#import "CardCell.h"
#import <AudioToolbox/AudioToolbox.h>

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

    self.imageView.layer.cornerRadius = 5;
//    self.layer.cornerRadius = 5;//cell.bounds.size.height / 2;
//    self.layer.borderColor = UIColor.whiteColor.CGColor;
//    self.layer.borderWidth = 1;
//    self.imageView.clipsToBounds = NO;
    self.clipsToBounds = NO;

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

    self.userInteractionEnabled = !isTapAllowed;
    NSLog(@"%d", isTapAllowed);
    UIViewAnimationOptions animationType = isTapAllowed ?
        UIViewAnimationOptionTransitionFlipFromRight : UIViewAnimationOptionTransitionFlipFromLeft;

    [UIView
     transitionWithView:self.imageView
     duration:.45
     options:animationType animations:^{

//         NSLog(@"%lu", (unsigned long)animationType);
         //        __weak typeof (self) weakSelf = self;
         //        weakSelf.myImageView.image = [UIImage imageNamed:@"who_am_i"];
         self.imageView.image = isTapAllowed ?
            [UIImage imageNamed:self.imageName] : [UIImage imageNamed:@"noImg"];

     } completion:^(BOOL finished) {
     }];
}

- (void)dismiss {
    
    [self dismissss:self];
}

- (void)dismissss: (UIView *)view {

//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate, ^{
        //
    });
    self.userInteractionEnabled = NO;
    [UIView
     animateWithDuration:.15
     animations:^{
         view.alpha = 1.0;
         view.transform = CGAffineTransformMakeScale(1.05, 1.05);
     }
     completion:^(BOOL finished) {

         [UIView
          animateWithDuration:0.15
          animations:^{
              view.alpha = 1.0;
              view.transform = CGAffineTransformMakeScale(0.95, 0.95);
          } completion:^(BOOL finished) {

              [UIView
               animateWithDuration:0.15
               animations:^{
                   view.alpha = 1.0;
                   view.transform = CGAffineTransformMakeScale(0.3, 0.3);
               } completion:^(BOOL finished) {
                   [view removeFromSuperview];
                   NSLog(@"animation finish");
               }];
          }];

     }];
}
/*
 
 func bounceView(view: UIView) {
     
     view.alpha = 1.0
     view.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
     
     UIView.animate(withDuration: 0.15, animations: {
         
         view.alpha = 1.0
         view.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
         
     }) { (finish) in
         
         UIView.animate(withDuration: 0.15, animations: {
             
             view.alpha = 1.0
             view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
             
         }, completion: { (finish) in
             print("animation finish")
         })
     }
 }
 
 */
@end
