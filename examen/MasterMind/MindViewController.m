//
//  MindViewController.m
//  MasterMind
//
//  Created by Fabrice Kordon on 11/01/2014.
//  Copyright (c) 2014 Fabrice Kordon. All rights reserved.
//

#import "MindViewController.h"

@interface MindViewController ()

@end

@implementation MindViewController

@synthesize gameEnded, rvc;

- (id)initWithIsIpad:(BOOL)b andGame:(aGame*)g{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        isIpad = b;
        currentGame = g;
        gameEnded = YES;
        // ==============================================================
        // ==============================================================
        // Question I.10
        // ==============================================================
        // ==============================================================

        
        [[self navigationItem] setTitle:@"Le jeu"];
        UIImage *img = [self resizeToSquare:[UIImage imageNamed:@"icone-jouer.png"] ofSize:30];
        UITabBarItem *tbi = [[UITabBarItem alloc] initWithTitle:@"Le jeu" image:img tag:1];
        [self setTabBarItem:tbi];
        [tbi release];
        // ==============================================================
        // fin question
        // ==============================================================
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // ==============================================================
    // ==============================================================
    // Question I.11
    // ==============================================================
    // ==============================================================
    [[self navigationItem] setRightBarButtonItem:[[[UIBarButtonItem alloc] autorelease] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newProposalOrGame)]];
    // ==============================================================
    // fin question
    // ==============================================================
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) newProposalOrGame {
    if (gameEnded) {
        [currentGame initializeGameWithSize:[rvc getDifficulty]];
        if (gameEvolution) {
            [gameEvolution release];
        }
        gameEvolution = [[NSMutableArray alloc] init];
        [gameEvolution addObject:[currentGame getInitString]];
        [[self tableView] reloadData];
        gameEnded = NO;
        if (input) {
            [input release];
            input = nil;
        }
        if (isIpad && pop) {
            [pop release];
            pop = nil;
        }
    } else {
        // ==============================================================
        // ==============================================================
        // Question I.12
        // ==============================================================
        // ==============================================================
        
        // ==============================================================
        // fin question
        // ==============================================================
    }
}

- (void) setNewProposition:(NSString*) newVal {
    [gameEvolution addObject:newVal];
    [[self tableView] reloadData];
    if (!isIpad) {
        [[self navigationController] popToRootViewControllerAnimated:YES];
    }
}

- (UIImageView*) getLastDiagnostic {
    if ([gameEvolution count] > 0) {
        UIImage *img = [[[[[self tableView] cellForRowAtIndexPath:[NSIndexPath indexPathForRow:[gameEvolution count] -1 inSection:0]] imageView] image] copy];
        return [[UIImageView alloc] initWithImage:img];
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [gameEvolution count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIImage *img = nil;
    int i, cptGreen = 0;
    if ([indexPath row] > 0) {
        NSArray *result = [[currentGame compareToProposalToSolution:[gameEvolution objectAtIndex:[indexPath row]]] componentsSeparatedByString:@" "];
        for (i = 0 ; i < [result count]; i++) {
            if (img) {
                img = [self mergeImage:img withImage:[UIImage imageNamed:[NSString stringWithFormat:@"dot-%@.png", [result objectAtIndex:i]]]];
            } else {
                img = [UIImage imageNamed:[NSString stringWithFormat:@"dot-%@.png", [result objectAtIndex:i]]];
            }
            if ([[result objectAtIndex:i] isEqualToString:@"green"]) {
                cptGreen++;
            }
        }
    }
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    // ==============================================================
    // ==============================================================
    // Question I.13
    // ==============================================================
    // ==============================================================
    
    // ==============================================================
    // fin question
    // ==============================================================
    
    return cell;}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */


- (UIImage *)resizeToSquare:(UIImage *)image ofSize:(int)dim {
    CGFloat scale = [[UIScreen mainScreen]scale];
    CGSize taille = {dim, dim};
    UIGraphicsBeginImageContextWithOptions(taille, NO, scale);
    [image drawInRect:CGRectMake(0, 0, dim, dim)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (UIImage*)mergeImage:(UIImage*)first withImage:(UIImage*)second {
    // get size of the first image
    CGImageRef firstImageRef = first.CGImage;
    CGFloat firstWidth = CGImageGetWidth(firstImageRef);
    CGFloat firstHeight = CGImageGetHeight(firstImageRef);
    
    // get size of the second image
    CGImageRef secondImageRef = second.CGImage;
    CGFloat secondWidth = CGImageGetWidth(secondImageRef);
    CGFloat secondHeight = CGImageGetHeight(secondImageRef);
    
    // build merged size
    CGSize mergedSize = CGSizeMake(firstWidth + secondWidth, MAX(firstHeight, secondHeight));
    
    // capture image context ref
    UIGraphicsBeginImageContext(mergedSize);
    
    //Draw images onto the context
    [first drawInRect:CGRectMake(0, 0, firstWidth, firstHeight)];
    [second drawInRect:CGRectMake(firstWidth, 0, secondWidth, secondHeight)];
    
    // assign context to new UIImage
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // end context
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)resizeToRectangle:(UIImage *)image ofWidth:(int)width andHeigth:(int)heigth {
    CGFloat scale = [[UIScreen mainScreen]scale];
    CGSize taille = {width, heigth};
    UIGraphicsBeginImageContextWithOptions(taille, NO, scale);
    [image drawInRect:CGRectMake(0, 0, width, heigth)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
