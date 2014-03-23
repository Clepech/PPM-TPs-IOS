//
//  MindViewController.h
//  MasterMind
//
//  Created by Fabrice Kordon on 11/01/2014.
//  Copyright (c) 2014 Fabrice Kordon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputViewController.h"
#import "aGame.h"

@interface MindViewController : UITableViewController <UIPopoverControllerDelegate> {
    NSMutableArray *gameEvolution;
    aGame *currentGame;
    BOOL isIpad;
    InputViewController *input;
    UIPopoverController *pop;
}

@property(readonly, nonatomic, assign) BOOL gameEnded; // Savoir si la partie est terminée
@property(readwrite, nonatomic, retain) UIViewController *rvc; // pointeur sur la vue de contrôle

// Initialisation avec le type de terminal
- (id) initWithIsIpad:(BOOL)b andGame:(aGame*)g;
// Positionner une nouvelle proposition dans l'historique des propositions
- (void) setNewProposition:(NSString*) newVal;
// Récupérer l'image contenant le dernier diafnostic créé
- (UIImageView*) getLastDiagnostic;

@end
