//
//  LoadDeck.h
//  LatinPractice
//
//  Created by Michael Alexander on 12/25/12.
//  Copyright (c) 2012 Michael Alexander. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface LoadDeck : NSObject

@property (nonatomic, strong) AppDelegate *root;

-(id)initWithRoot:(AppDelegate *)newRoot;
-(void)addCards;
@end
