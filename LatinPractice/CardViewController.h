//
//  CardViewController.h
//  LatinPractice
//
//  Created by Michael Alexander on 1/2/13.
//  Copyright (c) 2013 Michael Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardViewController : UIViewController

@property (nonatomic, strong) NSManagedObject *card;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *latinLabel;
@property (nonatomic, strong) UILabel *englishLabel;
@property (nonatomic, strong) UIButton *latinButton;
@property (nonatomic, strong) UIButton *englishButton;
@property (nonatomic, assign) BOOL englishActive;
@property (nonatomic, assign) BOOL latinActive;

-(id)initWithCard:(NSManagedObject *)newCard;
-(void)englishButtonPressed;
-(void)latinButtonPressed;
@end
