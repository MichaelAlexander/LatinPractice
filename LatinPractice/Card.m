//
//  Card.m
//  LatinPractice
//
//  Created by Michael Alexander on 1/2/13.
//  Copyright (c) 2013 Michael Alexander. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize english, latin, group, image;

-(id)initWithEnglish:(NSString *)newEnglish
               Latin:(NSString *)newLatin
               Group:(NSString *)newGroup
               Image:(NSString *)newImage
{
    self = [super init];
    
    english = newEnglish;
    latin = newLatin;
    group = newGroup;
    image = newImage;
    
    return self;
}

@end
