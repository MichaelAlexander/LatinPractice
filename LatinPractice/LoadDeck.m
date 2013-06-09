//
//  LoadDeck.m
//  LatinPractice
//
//  Created by Michael Alexander on 12/25/12.
//  Copyright (c) 2012 Michael Alexander. All rights reserved.
//

#import "LoadDeck.h"
#import "AppDelegate.h"
#import <sqlite3.h>

@implementation LoadDeck

@synthesize root;

-(id)initWithRoot:(AppDelegate *)newRoot
{
    self = [super init];
    
    root = newRoot;
    
    return self;
}

-(void)addCards
{
    /*
    sqlite3 *database;
	sqlite3_stmt *statement;
    
    //find database path
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *path = [paths objectAtIndex:0];
	NSString *fullPath = [path stringByAppendingPathComponent:@"ProduceTracker.db"];
	
	NSFileManager *fm = [NSFileManager defaultManager];
	
	BOOL exists = [fm fileExistsAtPath:fullPath];
	
	//check for database existence, copy over if it exists
	if (exists){
		NSLog(@"%@ exists - just openning", fullPath);
	}else {
        NSLog(@"does not exist");
    }
    
    //open database
	const char *cFullPath = [fullPath cStringUsingEncoding:NSUTF8StringEncoding];
	if (sqlite3_open_v2(cFullPath, &database, SQLITE_OPEN_READONLY, NULL) != SQLITE_OK) {
		NSLog(@"unable to open database at %@", fullPath);
	}
    
    //setup core data context
     NSManagedObjectContext *context = [root managedObjectContext];
    
    char *cQuery = "SELECT name FROM Store";  //"SELECT english, latin, groupName, image FROM Card";
    
    if (sqlite3_prepare_v2(database, cQuery, -1, &statement, NULL) != SQLITE_OK) {
        NSLog(@"Error %s", sqlite3_errmsg(database));
        NSLog(@"query error: %s", (char *) statement);
    }
    
    while (sqlite3_step(statement) == SQLITE_ROW) {
        const char *cEnglish = (const char*)sqlite3_column_text(statement, 0);
        NSString *english = [[NSString alloc] initWithUTF8String:cEnglish];
        
        const char *cLatin = (const char*)sqlite3_column_text(statement, 1);
        NSString *latin = [[NSString alloc] initWithUTF8String:cLatin];
        
        const char *cGroupName = (const char*)sqlite3_column_text(statement, 2);
        NSString *groupName = [[NSString alloc] initWithUTF8String:cGroupName];
        
        const char *cImage = (const char*)sqlite3_column_text(statement, 3);
        NSString *image = [[NSString alloc] initWithUTF8String:cImage];
        
        NSManagedObject *newObject = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
        [newObject setValue:english forKey:@"english"];
        [newObject setValue:latin forKey:@"latin"];
        [newObject setValue:image forKey:@"image"];
        [newObject setValue:groupName forKey:@"group"];*/
    
   // }
    //sqlite3_finalize(statement);
    //NSLog(@"prepare failed with error %s", sqlite3_errmsg(database));
    /*
    char *cQueryB = "SELECT groupName FROM GroupName";
    
    if (sqlite3_prepare_v2(database, cQueryB, -1, &statement, NULL) != SQLITE_OK) {
        NSLog(@"query error: %s", (char *) statement);
    }
    
    while (sqlite3_step(statement) == SQLITE_ROW) {
        const char *cName = (const char*)sqlite3_column_text(statement, 0);
        NSString *name = [[NSString alloc] initWithUTF8String:cName];
        
        NSManagedObject *groupObject = [NSEntityDescription insertNewObjectForEntityForName:@"Group" inManagedObjectContext:context];
        [groupObject setValue:name forKey:@"groupName"];
    }
    sqlite3_finalize(statement);
    NSLog(@"prepare failed with error %s", sqlite3_errmsg(database));*/
    
    /*
    NSManagedObject *groupOne = [NSEntityDescription insertNewObjectForEntityForName:@"Group" inManagedObjectContext:context];
    [groupOne setValue:@"color" forKey:@"groupName"];
    
    NSManagedObject *groupTwo = [NSEntityDescription insertNewObjectForEntityForName:@"Group" inManagedObjectContext:context];
    [groupTwo setValue:@"food" forKey:@"groupName"];
    
    NSManagedObject *foodWordOne = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [foodWordOne setValue:@"Wine" forKey:@"english"];
    [foodWordOne setValue:@"Vinum" forKey:@"latin"];
    [foodWordOne setValue:@"wine.png" forKey:@"image"];
    [foodWordOne setValue:@"food" forKey:@"group"];
    
    NSManagedObject *foodWordTwo = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [foodWordTwo setValue:@"Bread" forKey:@"english"];
    [foodWordTwo setValue:@"Panis" forKey:@"latin"];
    [foodWordTwo setValue:@"bread.png" forKey:@"image"];
    [foodWordTwo setValue:@"food" forKey:@"group"];
    
    NSManagedObject *foodWordThree = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [foodWordThree setValue:@"Milk" forKey:@"english"];
    [foodWordThree setValue:@"Lactis" forKey:@"latin"];
    [foodWordThree setValue:@"milk.png" forKey:@"image"];
    [foodWordThree setValue:@"food" forKey:@"group"];
    
    NSManagedObject *wordOne = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [wordOne setValue:@"Sky Blue" forKey:@"english"];
    [wordOne setValue:@"Caeruleus" forKey:@"latin"];
    [wordOne setValue:@"skyblue.png" forKey:@"image"];
    [wordOne setValue:@"color" forKey:@"group"];
    
    NSManagedObject *wordTwo = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [wordTwo setValue:@"Green" forKey:@"english"];
    [wordTwo setValue:@"Viridis" forKey:@"latin"];
    [wordTwo setValue:@"green.png" forKey:@"image"];
    [wordTwo setValue:@"color" forKey:@"group"];
    
    NSManagedObject *wordThree = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [wordThree setValue:@"Yellow" forKey:@"english"];
    [wordThree setValue:@"Croceus" forKey:@"latin"];
    [wordThree setValue:@"yellow.png" forKey:@"image"];
    [wordThree setValue:@"color" forKey:@"group"];
    
    NSManagedObject *wordFour = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [wordFour setValue:@"Red" forKey:@"english"];
    [wordFour setValue:@"Ruber" forKey:@"latin"];
    [wordFour setValue:@"red.png" forKey:@"image"];
    [wordFour setValue:@"color" forKey:@"group"];
    
    NSManagedObject *wordFive = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [wordFive setValue:@"White" forKey:@"english"];
    [wordFive setValue:@"Albus" forKey:@"latin"];
    [wordFive setValue:@"white.png" forKey:@"image"];
    [wordFive setValue:@"color" forKey:@"group"];
    
    NSManagedObject *wordSix = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [wordSix setValue:@"Black" forKey:@"english"];
    [wordSix setValue:@"Niger" forKey:@"latin"];
    [wordSix setValue:@"black.png" forKey:@"image"];
    [wordSix setValue:@"color" forKey:@"group"];
    
    NSManagedObject *wordSeven = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [wordSeven setValue:@"Brown" forKey:@"english"];
    [wordSeven setValue:@"Fuscus" forKey:@"latin"];
    [wordSeven setValue:@"brown.png" forKey:@"image"];
    [wordSeven setValue:@"color" forKey:@"group"];
    
    NSManagedObject *wordEight = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [wordEight setValue:@"Purple" forKey:@"english"];
    [wordEight setValue:@"Purpureus" forKey:@"latin"];
    [wordEight setValue:@"purple.png" forKey:@"image"];
    [wordEight setValue:@"color" forKey:@"group"];
    
    NSManagedObject *wordNine = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [wordNine setValue:@"Orange" forKey:@"english"];
    [wordNine setValue:@"Aurantius" forKey:@"latin"];
    [wordNine setValue:@"orange.png" forKey:@"image"];
    [wordNine setValue:@"color" forKey:@"group"];
    
    NSManagedObject *wordTen = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [wordTen setValue:@"Gray" forKey:@"english"];
    [wordTen setValue:@"Cinereus" forKey:@"latin"];
    [wordTen setValue:@"gray.png" forKey:@"image"];
    [wordTen setValue:@"color" forKey:@"group"];
    
    NSManagedObject *wordEleven = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [wordEleven setValue:@"Pink" forKey:@"english"];
    [wordEleven setValue:@"Roseus" forKey:@"latin"];
    [wordEleven setValue:@"pink.png" forKey:@"image"];
    [wordEleven setValue:@"color" forKey:@"group"];
    
    NSManagedObject *wordTwelve = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [wordTwelve setValue:@"Golden" forKey:@"english"];
    [wordTwelve setValue:@"Aureus" forKey:@"latin"];
    [wordTwelve setValue:@"golden.png" forKey:@"image"];
    [wordTwelve setValue:@"color" forKey:@"group"];
    
    NSManagedObject *wordThirteen = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:context];
    [wordThirteen setValue:@"Silver" forKey:@"english"];
    [wordThirteen setValue:@"Argenteus" forKey:@"latin"];
    [wordThirteen setValue:@"silver.png" forKey:@"image"];
    [wordThirteen setValue:@"color" forKey:@"group"];*/
    
}

@end
