//
//  LatinPracticeTests.h
//  LatinPracticeTests
//
//  Created by Michael Alexander on 12/25/12.
//  Copyright (c) 2012 Michael Alexander. All rights reserved.
//

#import <XCTest/XCTest.h>

@class Deck;

@interface LatinPracticeTests : XCTestCase

@property (nonatomic, strong) NSManagedObjectModel *model;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSPersistentStoreCoordinator *coord;
@property (nonatomic, strong) NSPersistentStore *store;
@property (nonatomic, strong) Deck *testDeck;

@end
