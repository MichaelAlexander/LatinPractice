//
//  FlipsideViewController.m
//  LatinPractice
//
//  Created by Michael Alexander on 12/25/12.
//  Copyright (c) 2012 Michael Alexander. All rights reserved.
//

#import "FlipsideViewController.h"
#import "MainViewController.h"
#import "Deck.h"

@interface FlipsideViewController ()

@property (nonatomic, strong) UISwitch *groupSwitch;
@property (nonatomic, strong) UILabel *switchLabel;
@property (nonatomic, strong) UIButton *shuffleButton;
@property (nonatomic, strong) UIPickerView *groupPicker;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) NSMutableArray *groupList;

- (IBAction)done:(id)sender;
- (void)shuffleButtonPressed;

@end

@implementation FlipsideViewController
@synthesize deck, shuffleButton, groupPicker, groupSwitch, switchLabel, groupList, mainViewDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil deck:(Deck *)newDeck
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        deck = newDeck;
        
        groupList = [deck getGroupList];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    switchLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 50.0, 210.0, 50.0)];
    [switchLabel setBackgroundColor:[UIColor clearColor]];
    [switchLabel setTextColor:[UIColor whiteColor]];
    [switchLabel setText:@"Limit to Selected Group:"];
    [self.view addSubview:switchLabel];
    
    groupSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(220.0, 60.0, 90.0, 50.0)];
    [groupSwitch setOn:FALSE];
    [self.view addSubview:groupSwitch];
    
    groupPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(10.0, 110.0, 300.0, 300.0)];
    [groupPicker setDataSource:self];
    [groupPicker setDelegate:self];
    [groupPicker setShowsSelectionIndicator:TRUE];
    [groupPicker setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:groupPicker];
    
    shuffleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [shuffleButton setFrame:CGRectMake(10.0, 420.0, 300.0, 40.0)];
    [shuffleButton setTitle:@"Shuffle" forState:UIControlStateNormal];
    [shuffleButton addTarget:self action:@selector(shuffleButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shuffleButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Picker View Delegate Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [groupList count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[groupList objectAtIndex:row] valueForKey:@"groupName"];
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

-(void)shuffleButtonPressed
{
    if ([groupSwitch isOn]) {
        [mainViewDelegate shuffleDeckWithGroup:[[groupList objectAtIndex:[groupPicker selectedRowInComponent:0]] valueForKey:@"groupName"]];
    }else{
        [mainViewDelegate shuffleDeckWithGroup:NULL];
    }
    
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
