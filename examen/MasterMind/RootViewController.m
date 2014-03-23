//
//  RootViewController.m
//  MasterMind
//
//  Created by Fabrice Kordon on 11/01/2014.
//  Copyright (c) 2014 Fabrice Kordon. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithIsIpad:(BOOL)b  andGame:(aGame*)g{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        theGame = g;
        [g setRvc:self];
        isIpad = b;
        if (isIpad) {
            myFrame = CGRectMake(0, 0, [[self view] bounds].size.height * 0.32, [[self view] bounds].size.height);
        } else {
            myFrame = [[UIScreen mainScreen] bounds];
        }
        // ==============================================================
        // ==============================================================
        // Question I.4
        // ==============================================================
        // ==============================================================
        [[self navigationItem] setTitle:@"Préférences"];
        UIImage *img = [self resizeToSquare:[UIImage imageNamed:@"icone-p+h.png"] ofSize:30];
        UITabBarItem *tbi = [[UITabBarItem alloc] initWithTitle:@"Préférences" image:img tag:1];
        [self setTabBarItem:tbi];
        [tbi release];
        // ==============================================================
        // fin question
        // ==============================================================
        
        UIView *v = [[UIView alloc] initWithFrame:myFrame];
        [v setBackgroundColor:[UIColor whiteColor]];
        [self setView:v];
        UIImageView *bg = [[UIImageView alloc] initWithImage:[self resizeToSquare:[UIImage imageNamed:@"fond-p+h.jpg"] ofSize:myFrame.size.height]];
        [bg setAlpha:0.2];
        [v addSubview:bg];

        l1 = [[UILabel alloc] init];
        [l1 setTextAlignment:NSTextAlignmentCenter];
        [l1 setText:@"Niveau du jeu"];
        [v addSubview:l1];

        tabDifficulty[0] = 4;
        tabDifficulty[1] = 6;
        tabDifficulty[2] = 8;
        sg1 = [[UISegmentedControl alloc] initWithItems:[[NSArray alloc] initWithArray:[NSArray arrayWithObjects:@"Kindergarden", @"Bon gars", @"Master Jedi", nil]]];
        [sg1 setSelectedSegmentIndex:[theGame difficulty]];
        [v addSubview:sg1];

        l2 = [[UILabel alloc] init];
        [l2 setTextAlignment:NSTextAlignmentCenter];
        [l2 setText:@"Statistiques"];
        [v addSubview:l2];

        pv = [[UIProgressView alloc] init];
        [pv setProgressTintColor:[UIColor colorWithRed:0 green:0.4 blue:0.2 alpha:1]];
        [pv setTrackTintColor:[UIColor redColor]];
        [v addSubview:pv];
        
        l3 = [[UILabel alloc] init];
        [l3 setTextAlignment:NSTextAlignmentCenter];
        [l3 setFont:[UIFont systemFontOfSize:11]];
        [l3 setTextAlignment:NSTextAlignmentLeft];
        [v addSubview:l3];
        
        // ==============================================================
        // ==============================================================
        // Question I.3
        // ==============================================================
        // ==============================================================
        wv = [[UIWebView alloc] init];
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"doc" ofType:@"html"]];
        NSLog(@"%@", [url path]);
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [wv loadRequest:req];
        [v addSubview:wv];
        // Pour NSURL et NSURLREQUEST
        // Pas besoin de release : pas d'alloc
        // Pas besoin de retain : les objets sont réutlisé tout de suite (autorelase pas fait)
        
        // ==============================================================
        // fin question
        // ==============================================================
        
        // Pour question I.7, force la mise à
        [self didRotateFromInterfaceOrientation:[self interfaceOrientation]];
        
        [l1 release];
        [l2 release];
        [l3 release];
        [pv release];
        [sg1 release];
        [wv release];
        [self displayValues];
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    // ==============================================================
    // ==============================================================
    // Question I.5
    // ==============================================================
    // ==============================================================
    [[self navigationItem] setLeftBarButtonItem:[[[UIBarButtonItem alloc] autorelease] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(sauvegarde)]];
     
    // ==============================================================
    // fin question
    // ==============================================================
    if (isIpad) {
        [self willRotateToInterfaceOrientation:UIInterfaceOrientationPortrait duration:0];
    } else {
        [self willRotateToInterfaceOrientation:[[UIApplication sharedApplication] statusBarOrientation] duration:0];
    }
}

- (void)displayValues {
    [l3 setText:[NSString stringWithFormat:@"Parties gagnées avec les essais autorisés: %d/%d", [theGame getLessGames], [theGame getLessGames]+[theGame getMoreGames]]];
    [pv setProgress:[theGame statistics]];
    [self sauvegarde];
}

- (void) sauvegarde {
    NSArray *dir = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[dir objectAtIndex:0] stringByAppendingPathComponent:@"sauvegarde"];
    [theGame setDifficulty:[sg1 selectedSegmentIndex]];
    BOOL res = [NSKeyedArchiver archiveRootObject:theGame  toFile:path];
    if (!res) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur" message:@"Les préférences n'ont pu être sauvegardées, sans doute faure de place" delegate:nil cancelButtonTitle:@"Continuer" otherButtonTitles:nil];
        [alert show];
    }
}

- (int) getDifficulty {
    int i = [sg1 selectedSegmentIndex];
    return tabDifficulty[i];
}

- (BOOL)shouldAutorotate {
    if (isIpad) {
        return NO;
    } else {
        return YES;
    }
}

// utilisation de l'autre méthode, en interogeant directement l'orientation courante
//- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    int posY;
    int hauteur;
    int bas;
    posY = 70; // hauteur du premier objet
    hauteur = 20; // delta hauteur d'un objet
    
    int bord = 14;
    CGRect superFrame = [[self view] bounds];
    if ([self interfaceOrientation] == UIInterfaceOrientationLandscapeLeft ||
        [self interfaceOrientation] == UIInterfaceOrientationLandscapeRight) { // Modifé
        // ==============================================================
        // ==============================================================
        // Question I.7
        // ==============================================================
        // ==============================================================
        //Mode paysage
        
        hauteur = 5;
        // ==============================================================
        // fin question
        // ==============================================================
    } //else {
        if (isIpad) {
            bas = 100;
        } else {
            bas = 70;
        }
        // ==============================================================
        // ==============================================================
        // Question I.7
        // ==============================================================
        // ==============================================================
        // mode portait
        [l1 setFrame:CGRectMake(bord, posY, superFrame.size.width - 2*bord, 30)];
         posY += hauteur + l1.frame.size.height;
        NSLog(@"posY %d", posY);
        NSLog(@" %f", l1.frame.size.height);
        
        [sg1 setFrame:CGRectMake(bord, posY, superFrame.size.width - 2*bord, 30)];
         posY += hauteur + sg1.frame.size.height;
        NSLog(@"posY %d", posY);
        
        [l2 setFrame:CGRectMake(bord, posY, superFrame.size.width - 2*bord, 30)];
        posY += hauteur + l2.frame.size.height;
        NSLog(@"posY %d", posY);
        
        [pv setFrame:CGRectMake(bord, posY, superFrame.size.width - 2*bord, 30)];
        posY += hauteur + pv.frame.size.height;
        NSLog(@"posY %d", posY);
        
        [l3 setFrame:CGRectMake(bord, posY, superFrame.size.width - 2*bord, 30)];
        posY += hauteur + l3.frame.size.height;
        
        [wv setFrame:CGRectMake(bord, posY, superFrame.size.width - 2*bord, posY - bas)];
        posY += hauteur + wv.frame.size.height;
        // ==============================================================
        // fin question
        // ==============================================================
    //}
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)resizeToSquare:(UIImage *)image ofSize:(int)dim {
    CGFloat scale = [[UIScreen mainScreen]scale];
    CGSize taille = {dim, dim};
    UIGraphicsBeginImageContextWithOptions(taille, NO, scale);
    [image drawInRect:CGRectMake(0, 0, dim, dim)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
