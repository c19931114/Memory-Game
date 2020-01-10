//
//  Card.h
//  ObjectiveC_practice
//
//  Created by Crystal on 2020/1/9.
//  Copyright © 2020 Crystal_In_The_House. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match: (Card *)card;

@end

NS_ASSUME_NONNULL_END
