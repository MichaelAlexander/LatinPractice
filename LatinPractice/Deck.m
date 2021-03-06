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
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Card"
                                              inManagedObjectContext:root];
    [fetchRequest setEntity:entity];
    
    //limit deck to just one group if selected
    if (group) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"group == %@", group];
        
        [fetchRequest setPredicate:predicate];
    }
    
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
    
    [self shuffleDeck];
}

-(void)shuffleDeck
{
    NSUInteger count = [deck count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [deck exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

-(NSMutableArray *)getGroupList
{
    NSMutableArray *groupList = [[NSMutableArray alloc] init];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Group"
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
            [groupList addObject:[fetchedObjects objectAtIndex:i]];
        }
    }
    
    return groupList;
}

-(NSInteger)getDeckSize
{
    return [deck count];
}

-(void)insertTestGroup:(NSString *)testGroupName
{
    NSManagedObject *testGroup = [NSEntityDescription insertNewObjectForEntityForName:@"Group" inManagedObjectContext:root];
    [testGroup setValue:testGroupName forKey:@"groupName"];
}

-(void)insertTestCardWithGroup:(NSString *)testGroupName
{
    NSManagedObject *testCard = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:root];
    [testCard setValue:@"test" forKey:@"english"];
    [testCard setValue:@"test" forKey:@"latin"];
    [testCard setValue:@"test" forKey:@"image"];
    [testCard setValue:testGroupName forKey:@"group"];
}

@end
