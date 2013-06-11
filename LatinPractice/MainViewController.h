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

@property (nonatomic, strong) UIScrollView *deckView;
@property (nonatomic, assign) int page;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) NSMutableArray *views;

- (id)initWithDeck:(Deck *)newDeck;
- (IBAction)showInfo:(id)sender;
- (void)loadDeckView;
- (void)shuffleDeckWithGroup:(NSString *)group;
@end
