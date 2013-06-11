//
//  LatinPracticeTests.m
//  LatinPracticeTests
//
//  Created by Michael Alexander on 12/25/12.
//  Copyright (c) 2012 Michael Alexander. All rights reserved.
//

#import "LatinPracticeTests.h"
#import "Deck.h"

@implementation LatinPracticeTests

@synthesize model, context, coord, store, testDeck;

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    NSArray *bundles = [NSArray arrayWithObject:[NSBundle bundleForClass:[self class]]];
    model = [NSManagedObjectModel mergedModelFromBundles: bundles];
    //NSLog(@"model: %@", model);
    coord = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: model];
    
    store = [coord addPersistentStoreWithType: NSInMemoryStoreType
                                                    configuration: nil
                                                              URL: nil
                                                          options: nil
                                                            error: NULL];
    
    context = [[NSManagedObjectContext alloc] init];
    [context setPersistentStoreCoordinator: coord];
    
    testDeck = [[Deck alloc] initWithRoot:context];
}

- (void)tearDown
{
    // Tear-down code here.
    
    context = nil;
    NSError *error = nil;
    STAssertTrue([coord removePersistentStore: store error: &error],
                 @"couldn't remove persistent store: %@", error);
    store = nil;
    coord = nil;
    model = nil;
    
    [super tearDown];
}

- (void)testThatEnvironmentWorks
{
    STAssertNotNil(store, @"no persistent store");
}

- (void)testThatDeckLoads
{
    STAssertNotNil([self.testDeck deck], @"deck not loading");
}

- (void)testDeckProperties
{
    //seed data
    [testDeck insertTestGroup:@"Animals"];
    [testDeck insertTestGroup:@"Colors"];
    [testDeck insertTestCardWithGroup:@"Animals"];
    [testDeck insertTestCardWithGroup:@"Animals"];
    [testDeck insertTestCardWithGroup:@"Colors"];
    
    //load all cards and count
    [testDeck loadDeckWithGroup:NULL];
    
    int totalCards = [testDeck getDeckSize];
    
    //reduce to single group and count
    [testDeck loadDeckWithGroup:@"Animals"];
    
    int cardsAfterLimiting = [testDeck getDeckSize];
    
    STAssertTrue(totalCards > cardsAfterLimiting, @"number of cards not reduced after group selected");
    NSLog(@"Total: %i Reduced: %i", totalCards, cardsAfterLimiting);
    
}

@end
