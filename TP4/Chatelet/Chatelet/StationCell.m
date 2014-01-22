//
//  StationCell.m
//  Chatelet
//
//  Created by m2sar on 09/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "StationCell.h"

@implementation StationCell

@synthesize name;
@synthesize imageName;
@synthesize isJedi;
@synthesize index;

NSArray *namesList;
NSArray *sides;

// On creera tout
- (id)initWithIndex:(int)i{
    self = [self init];
    if (self) {
        index = i;
        imageName = [NSString stringWithFormat:@"planete-%d.pnd", index];
        [imageName retain];
        name = [[StationCell getNamesList] objectAtIndex:index];
        [name retain];
        isJedi = [[[StationCell getSides] objectAtIndex:index]boolValue];
    }
    return self;
}

+ (NSArray *) getNamesList{
    if (! namesList) {
        namesList =  [[NSArray alloc] initWithObjects:@"Tatooine", @"Yavin IV",@"Endor", @"Geonosis", @"Hoth", @"Coruscan", @"Alderaan", @"Bespin", @"Kamino", @"Mustafar", @"Dagobah", @"Dantooine", @"Bestine", @"Polus", @"Mon Calamari", @"Kuat", @"Shola", @"Ryloth", @"Alzoc III", @"Jabiim", nil];
        [namesList retain];
    }
    return namesList;
}

+ (NSArray *) getSides{
    if (! sides) {
        sides =  [[NSArray alloc] initWithObjects: [NSNumber numberWithBool:YES], [NSNumber numberWithBool:YES], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:YES], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:YES], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:YES], [NSNumber numberWithBool:YES], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:YES], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:YES], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:YES], nil];
        [sides retain];
    }
    return sides;
}


//*
-(void)dealloc {
    /*
    [namesList release];
    namesList = nil;
    [sides release];
    sides = nil;
    */
    [imageName release];
    imageName = nil;
    [name release];
    name = nil;
    [super dealloc];
}
 //*/
@end
