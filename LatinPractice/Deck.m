//
//  Deck.m
//  LatinPractice
//
//  Created by Michael Alexander on 1/2/13.
//  Copyright (c) 2013 Michael Alexander. All rights reserved.
//

#import "Deck.h"
#import "Card.h"
#import "AppDelegate.h"

@implementation Deck

@synthesize deck, root;

-(id)initWithRoot:(NSManagedObjectContext *)newRoot
{
    self = [super init];
    
    self.root = newRoot;
    
    [self loadDeckWithGroup:NULL];
    
    return self;
}

-(void)loadDeckWithGroup:(NSString *)group
{
    if (!deck) {
        deck = [[NSMutableArray alloc] init];
    }else{
        [deck removeAllObjects];
    }
    
    if (!group) {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Card"
                                                  inManagedObjectContext:root];
        [fetchRequest setEntity:entity];
        
        NSError *error = nil;
        NSArray *fetchedObjects = [root executeFetchRequest:fetchRequest error:&error];
        if (fetchedObjects == nil) {
            NSLog(@"Fetch Error");
        }
        
        if ([fetchedObjects count] == 0) {
            NSLog(@"Empty");
        }else {
            for (int i=0; i<fetchedObjects.count; i++) {
                [deck addObject:[fetchedObjects objectAtIndex:i]];
            }
        }
    }else{
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Card"
                                                  inManagedObjectContext:root];
        [fetchRequest setEntity:entity];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"group == %@", group];
        
        [fetchRequest setPredicate:predicate];
        
        NSError *error = nil;
        NSArray *fetchedObjects = [root executeFetchRequest:fetchRequest error:&error];
        if (fetchedObjects == nil) {
            NSLog(@"Fetch Error");
        }
        
        if ([fetchedObjects count] == 0) {
            NSLog(@"Empty");
        }else {
            for (int i=0; i<fetchedObjects.count; i++) {
                [deck addObject:[fetchedObjects objectAtIndex:i]];
            }
        }
    }
    
    NSUInteger count = [deck count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [deck exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end
