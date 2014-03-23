//
//  InputViewController.h
//  MasterMind
//
//  Created by Fabrice Kordon on 11/01/2014.
//  Copyright (c) 2014 Fabrice Kordon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputViewController : UIViewController {
    CGRect myFrame;
    UIView *v;
    NSMutableArray *sgtab;
    UIButton *button;
    BOOL isIpad;
    id myParent;
    UIImageView *diagnostic;
}

// Initialisation. b indique le type de terminal, t la liste des valeurs possibles dans chaque élément
// de la combinaison, li la dernière proposition effectuée et p une référence à la classe parente (de
// type MondViewController)
- (id)initWithIpad:(BOOL) b andPossibleValues:(NSArray*) t andLastInput:(NSString*)li andWithParent:(id)p;

@end
