//
//  CardCell.h
//  ObjectiveC_practice
//
//  Created by Crystal on 2020/1/8.
//  Copyright © 2020 Crystal_In_The_House. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum MatchStatus {
    choosing,
    isMatched,
    unMatched,
} MatchStatus;

@interface CardCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,strong) NSString *imageName;
@property (nonatomic) BOOL isChosen;
@property (nonatomic, copy) MatchStatus (^flipppppp)(NSString *cardName);


- (void)flipCard: (BOOL)isTapAllowed;

@end

NS_ASSUME_NONNULL_END
