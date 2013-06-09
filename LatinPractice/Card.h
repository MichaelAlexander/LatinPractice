//
//  Card.h
//  LatinPractice
//
//  Created by Michael Alexander on 1/2/13.
//  Copyright (c) 2013 Michael Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString *english;
@property (nonatomic, strong) NSString *latin;
@property (nonatomic, strong) NSString *group;
@property (nonatomic, strong) NSString *image;

-(id)initWithEnglish:(NSString *)newEnglish
               Latin:(NSString *)newLatin
               Group:(NSString *)newGroup
               Image:(NSString *)newImage;

@end
