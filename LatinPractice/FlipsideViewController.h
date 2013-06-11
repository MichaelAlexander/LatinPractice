//
//  FlipsideViewController.h
//  LatinPractice
//
//  Created by Michael Alexander on 12/25/12.
//  Copyright (c) 2012 Michael Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController, MainViewController, Deck;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;
@property (nonatomic, strong) UISwitch *groupSwitch;
@property (nonatomic, strong) UILabel *switchLabel;
@property (nonatomic, strong) UIButton *shuffleButton;
@property (nonatomic, strong) UIPickerView *groupPicker;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) NSMutableArray *groupList;
@property (nonatomic, strong) MainViewController *mainViewDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil deck:(Deck *)newDeck;
- (IBAction)done:(id)sender;
- (void)shuffleButtonPressed;

@end
