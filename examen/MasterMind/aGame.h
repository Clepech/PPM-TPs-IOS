//
//  aGame.h
//  MasterMind
//
//  Created by Fabrice Kordon on 11/01/2014.
//  Copyright (c) 2014 Fabrice Kordon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface aGame : NSObject <NSCoding> {
    int gameSize;
    float less, more;
    NSMutableArray *theSolution;
    NSArray *possibleValues;
}

@property(readonly, nonatomic, retain) NSArray *possibleValues; // l'ensemble des valeurs possibles dans les combinaisons
@property(readonly, nonatomic, assign) float statistics; // ratio de partie "gagnées" sur l'ensemble des parties jouées
@property(readwrite, nonatomic, assign) BOOL debugMode; // mode debug qui affiche la solution (accès programmatique seulement)
@property(readwrite, nonatomic, assign) int difficulty; // le niveau de difficulté
@property(readwrite, nonatomic, retain) UIViewController *rvc; // référence sur la vue maître
@property(readonly, nonatomic, assign) int gameSize; // le nombre d'élements dans la combinaison

// Initialisation
- (void) initializeGameWithSize:(int) s;
// Comparer une proposition à la solution (privée). Cette fonction rend
// une chaîne permettant de construire l'image de diagnostic. Cette chaîne
// est une succession de couleurs séparées par un espace (red, organce, green)
- (NSString*) compareToProposalToSolution:(NSString*)prop;
// Affichage de la chaîne associée au disagnostic qui affiche les éléments trouvés
- (NSString*) discoveredElementsFromProposal:(NSString*)prop;
// Récupérer la chaine correspodnant à la proposition initiale (largeur dépendant du niveau de jeu)
- (NSString*) getInitString;
// Rajouter une parie dans la liste des parties jouées en indiquant si elle a été "gagnée" (YES) ou non (NO)
- (void) increaseGame:(BOOL)won;
// récupérer les parties "gagnées" = combinaison trouvée en moins de coups que le minimum autorisé
- (int) getLessGames;
// récupérer les parties "perdues" = combinaison trouvée en plus de coups que le minimum autorisé
- (int) getMoreGames;

@end
