//
//  GameViewController.h
//  ObjectiveC_practice
//
//  Created by Crystal on 2020/1/6.
//  Copyright © 2020 Crystal_In_The_House. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (nonatomic) int row;

@end

NS_ASSUME_NONNULL_END
