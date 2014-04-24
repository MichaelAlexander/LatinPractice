//
//  CardViewController.m
//  LatinPractice
//
//  Created by Michael Alexander on 1/2/13.
//  Copyright (c) 2013 Michael Alexander. All rights reserved.
//

#import "CardViewController.h"

@interface CardViewController ()

@property (nonatomic, strong) NSManagedObject *card;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *latinLabel;
@property (nonatomic, strong) UILabel *englishLabel;
@property (nonatomic, strong) UIButton *latinButton;
@property (nonatomic, strong) UIButton *englishButton;
@property (nonatomic, assign) BOOL englishActive;
@property (nonatomic, assign) BOOL latinActive;

-(void)englishButtonPressed;
-(void)latinButtonPressed;

@end

@implementation CardViewController
@synthesize card, imageView, latinButton, latinLabel, englishButton, englishLabel, englishActive, latinActive;

-(id)initWithCard:(NSManagedObject *)newCard
{
    self = [super init];
    
    card = newCard;
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    englishActive = 0;
    latinActive = 0;
    
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[card valueForKey:@"image"]]];
    [imageView setFrame:CGRectMake(10.0, 30.0, 300.0, 300.0)];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:imageView];
    
    latinLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 340.0, 300.0, 30.0)];
    [latinLabel setTextAlignment:NSTextAlignmentCenter];
    [latinLabel setBackgroundColor:[UIColor clearColor]];
    [latinLabel setTextColor:[UIColor whiteColor]];
    [self.view addSubview:latinLabel];
    
    englishLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 383.0, 300.0, 30.0)];
    [englishLabel setTextAlignment:NSTextAlignmentCenter];
    [englishLabel setBackgroundColor:[UIColor clearColor]];
    [englishLabel setTextColor:[UIColor whiteColor]];
    [self.view addSubview:englishLabel];
    
    latinButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [latinButton setFrame:CGRectMake(10.0, 406.0, 140.0, 30.0)];
    [latinButton setTitle:@"Latin" forState:UIControlStateNormal];
    [latinButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [latinButton addTarget:self action:@selector(latinButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:latinButton];
    
    englishButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [englishButton setFrame:CGRectMake(160.0, 406.0, 140.0, 30.0)];
    [englishButton setTitle:@"English" forState:UIControlStateNormal];
    [englishButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [englishButton addTarget:self action:@selector(englishButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:englishButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)latinButtonPressed
{
    if (!latinActive) {
        [latinLabel setText:[card valueForKey:@"latin"]];
        latinActive = 1;
    }else{
        [latinLabel setText:@""];
        latinActive = 0;
    }
}

-(void)englishButtonPressed
{
    if (!englishActive) {
        [englishLabel setText:[card valueForKey:@"english"]];
        englishActive = 1;
    }else{
        [englishLabel setText:@""];
        englishActive = 0;
    }
}

@end
