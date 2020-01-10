//
//  Card.m
//  ObjectiveC_practice
//
//  Created by Crystal on 2020/1/9.
//  Copyright © 2020 Crystal_In_The_House. All rights reserved.
//

#import "Card.h"

@implementation Card


- (int)match: (Card *)otherCards {
    int score = 0;
    
    if ([otherCards.contents isEqualToString:self.contents]) {
        score = 1;
    }
        
    return score;
}

/*
- (int)match: (Card *)card {
    int score = 0;
    return score;
}
func match(_ card: Card?) -> Int {
    let score = 0
    return score
}
===================================
- (int)matchToCards: (Card *)card {
    int score = 0;
    return score;
}
func match(toCards card: Card?) -> Int {
    let score = 0
    return score
}
===================================
- (int)matchToCard: (Card *)card {
    int score = 0;
    return score;
}
func match(to card: Card?) -> Int {
    let score = 0
    return score
}
===================================
- (SCNNode *)planeFromAnchor:(ARPlaneAnchor *)anchor {}
func plane(from anchor: ARPlaneAnchor?) -> SCNNode? {}
*/
@end
