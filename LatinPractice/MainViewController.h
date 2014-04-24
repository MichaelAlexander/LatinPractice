//
//  MainViewController.h
//  LatinPractice
//
//  Created by Michael Alexander on 12/25/12.
//  Copyright (c) 2012 Michael Alexander. All rights reserved.
//

#import "FlipsideViewController.h"

#import <CoreData/CoreData.h>

@class Deck;

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIScrollViewDelegate>

- (id)initWithDeck:(Deck *)newDeck;
- (void)shuffleDeckWithGroup:(NSString *)group;

@end
