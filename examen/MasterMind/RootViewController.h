//
//  RootViewController.h
//  MasterMind
//
//  Created by Fabrice Kordon on 11/01/2014.
//  Copyright (c) 2014 Fabrice Kordon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "aGame.h"

@interface RootViewController : UIViewController  <UISplitViewControllerDelegate> {
    BOOL isIpad;
    CGRect myFrame;
    aGame *theGame;
    int tabDifficulty[3];

    UILabel *l1, *l2, *l3;
    UISegmentedControl *sg1;
    UIProgressView *pv;
    // ==============================================================
    // ==============================================================
    // Question I.3
    // ==============================================================
    // ==============================================================
    UIWebView *wv;
    // ==============================================================
    // fin question
    // ==============================================================
    //CGRect H
}

// Initialisation avec le type de terminal
- (id)initWithIsIpad:(BOOL)b andGame:(aGame*)g;
// Afficher les éléments de la vue
- (void)displayValues;
// Récupérer la dificulté du jeu (0, 1, 2)
- (int) getDifficulty;

@end
