//
//  Deck.h
//  LatinPractice
//
//  Created by Michael Alexander on 1/2/13.
//  Copyright (c) 2013 Michael Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Deck : NSObject

@property (nonatomic, strong) NSMutableArray *deck;
@property (nonatomic, strong) NSManagedObjectContext *root;

-(id)initWithRoot:(NSManagedObjectContext *)newRoot;
-(void)loadDeckWithGroup:(NSString *)group;
-(int)getDeckSize;
-(void)insertTestGroup:(NSString *)testGroupName;
-(void)insertTestCardWithGroup:(NSString *)testGroupName;

@end
