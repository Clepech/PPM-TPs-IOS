//
//  aGame.m
//  MasterMind
//
//  Created by Fabrice Kordon on 11/01/2014.
//  Copyright (c) 2014 Fabrice Kordon. All rights reserved.
//

#import "aGame.h"

@implementation aGame;

@synthesize possibleValues, debugMode, difficulty, gameSize;

- (id) init {
    self = [super init];
    if (self) {
        debugMode = NO;
        difficulty = 0;
        
        less = 0;
        more = 0;
    }
    return self;
}

- (void) initializeGameWithSize:(int) s {
    possibleValues = [[NSArray alloc] initWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", nil];
    if (theSolution) {
        [theSolution release];
        theSolution = nil;
    }
    gameSize = s;
    theSolution = [[NSMutableArray alloc] init];
    int i;
    for (i = 0 ; i < gameSize ; i++) {
        int v = arc4random() % 4;
        [theSolution addObject:[possibleValues objectAtIndex:v]];
    }
}

- (int) isVal:(NSString*)v inTable:(NSArray*)tab {
    int i;
    for (i = 0; i < [tab count]; i++) {
        if ([[tab objectAtIndex:i] isEqualToString:v]) {
            return i;
        }
    }
    return -1;
}

- (NSString*) compareToProposalToSolution:(NSString*)prop {
    int i, check1, check2, bienplace = 0, malplace = 0;
    NSString *res = @"";
    NSRange r;
    int cptsize = [possibleValues count];
    int cpt[cptsize];
    for (i = 0 ; i < [possibleValues count] ; i++) {
        cpt[i] = 0;
    }
    // Préparer le calcul
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (i = 0; i < gameSize ;i++) {
        r.location = i;
        r.length = 1;
        [temp addObject:[prop substringWithRange:r]];
    }
    for (i = 0 ; i < [theSolution count]; i++) {
        check1 = [self isVal:[theSolution objectAtIndex:i] inTable:possibleValues];
        if (check1 >= 0) {
            cpt[check1] = cpt[check1] + 1;
        }
    }
    
    // Calculer la réponse
    for (i = 0 ; i < [temp count]; i++) {
        r.location = i;
        r.length = 1;
        if ([[prop substringWithRange:r] isEqualToString:[theSolution objectAtIndex:i]]) {
            check2 = [self isVal:[prop substringWithRange:r] inTable:possibleValues];
            bienplace++;
            cpt[check2]--;
        } else {
            check1 = [self isVal:[prop substringWithRange:r] inTable:theSolution];
            check2 = [self isVal:[prop substringWithRange:r] inTable:possibleValues];
            if (cpt[check2] > 0) {
                malplace++;
                cpt[check2]--;
            }
        }
    }
    for (i = 0; i < bienplace ; i++) {
            res = [res stringByAppendingString:@"green "];
    }
    for (i = 0; i < malplace ; i++) {
        res = [res stringByAppendingString:@"orange "];
    }
    for (i = 0; i < gameSize - bienplace - malplace ; i++) {
        res = [res stringByAppendingString:@"red "];
    }
    return res;
}

- (NSString*) discoveredElementsFromProposal:(NSString*)prop {
    int i;
    NSString *res = @"";
    NSRange r;
    for (i = 0 ; i < gameSize ; i++) {
        r.location = i;
        r.length = 1;
        if ([[prop substringWithRange:r] isEqualToString:[theSolution objectAtIndex:i]]) {
            res = [res stringByAppendingString:[NSString stringWithFormat:@"%@ ", [theSolution objectAtIndex:i]]];
        } else {
            res = [res stringByAppendingString:@"- "];
        }
    }
    if (debugMode) {
        res = [res stringByAppendingString:@"   =>   "];
        for (i = 0 ; i < gameSize ; i++) {
            res = [res stringByAppendingString:[NSString stringWithFormat:@"%@ ", [theSolution objectAtIndex:i]]];
        }
    }
    return res;
}

- (NSString*) getInitString {
    NSString *tmp = @"-";
    int i;
    for (i = 0 ; i < gameSize ; i++) {
        tmp = [NSString stringWithFormat:@"-%@", tmp];
    }
    return tmp;
}

- (void) increaseGame:(BOOL)won {
    if (won) {
        less++;
    } else {
        more++;
    }
    _statistics =  less / (more + less);
    [_rvc displayValues];
}

- (int) getLessGames {
    return (int) less;
}

- (int) getMoreGames {
    return (int) more;
}

// protocole NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder {
    // ==============================================================
    // ==============================================================
    // Question I.14
    // ==============================================================
    // ==============================================================
    
    // ==============================================================
    // fin question
    // ==============================================================
    //NSLog(@"encodeWithCoder a écrit %d, %d, %f, %f, %f", gameSize, difficulty, less, more, _statistics);
}

- (id)initWithCoder:(NSCoder *)decoder {
    // ==============================================================
    // ==============================================================
    // Question I.14
    // ==============================================================
    // ==============================================================
    
    // ==============================================================
    // fin question
    // ==============================================================
    //NSLog(@"encodeWithCoder a lu %d, %d, %f, %f, %f", gameSize, difficulty, less, more, _statistics);
    return self;
}

@end
