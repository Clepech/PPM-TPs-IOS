//
//  InputViewController.m
//  MasterMind
//
//  Created by Fabrice Kordon on 11/01/2014.
//  Copyright (c) 2014 Fabrice Kordon. All rights reserved.
//

#import "InputViewController.h"

@interface InputViewController ()

@end

@implementation InputViewController

- (id)initWithIpad:(BOOL) b andPossibleValues:(NSArray*) t andLastInput:(NSString*)li andWithParent:(id)p{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        myParent = p;
        isIpad = b;
        if (isIpad) {
            myFrame = CGRectMake(0, 0, 320, 480);
        } else {
            myFrame = [[UIScreen mainScreen] bounds];
        }
        v = [[UIView alloc] init];
        [v setBackgroundColor:[UIColor whiteColor]];
        [self setView:v];
        NSRange r;
        r.length = 1;
        // ==============================================================
        // ==============================================================
        // Question I.8
        // ==============================================================
        // ==============================================================
        UISegmentedControl *sg;
        NSArray *sgItems;
        for (int i=0; i<6; i++) {
            sgItems = [[NSArray alloc] initWithArray:t]; // ON REFAIT L'ARRAY??
            sg = [[UISegmentedControl alloc] initWithItems:sgItems];
            [sgtab addObject:sg];
            [sgItems release];
            [v addSubview:sg];
            [sg release];
        }
        
        button = [[UIButton alloc] init];
        [button setTitle:@"Enregistrer la Séquence" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(setValues:) forControlEvents:UIControlEventTouchDown];
        // ==============================================================
        // fin question
        // ==============================================================
    }
    return self;
}

- (void) setValue:(id) from {
    NSString *tmp = @"";
    int i;
    for ( i = 0 ; i < [sgtab count] ; i++) {
        tmp = [tmp stringByAppendingString:[[sgtab objectAtIndex:i] titleForSegmentAtIndex:[[sgtab objectAtIndex:i] selectedSegmentIndex]]];
    }
    [myParent setNewProposition:tmp];
}

- (void) viewWillAppear:(BOOL)animated {
    if (!isIpad) {
        if (diagnostic) {
            [diagnostic removeFromSuperview];
            [diagnostic release];
        }
        diagnostic = [myParent getLastDiagnostic];
        [v addSubview:diagnostic];
    }
    if (isIpad) {
        [self willRotateToInterfaceOrientation:UIInterfaceOrientationPortrait duration:0];
    } else {
        [self willRotateToInterfaceOrientation:[[UIApplication sharedApplication] statusBarOrientation] duration:0];
    }
    [self setTitle:@"Saisie d'un coup"];
}

/*- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}*/

// Délégation pour gérer la rotation

- (BOOL)shouldAutorotate {
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
#define HAUTEUR 25
    int posY;
    int space;
    int i;
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        posY = 70;
        space = 10 ;
        // ==============================================================
        // ==============================================================
        // Question I.9
        // ==============================================================
        // ==============================================================
        // en attendant pour que cela fonctionne
        
        // ==============================================================
        // fin question
        // ==============================================================
    } else {
        if (isIpad) {
            posY = 50;
        } else {
            posY = 80;
        }
        // ==============================================================
        // ==============================================================
        // Question I.9
        // ==============================================================
        // ==============================================================
        // en attendant pour que cela fonctionne
        
        // ==============================================================
        // fin question
        // ==============================================================
   }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
