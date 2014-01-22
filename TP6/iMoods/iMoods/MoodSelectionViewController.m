//
//  MoodSelectionViewController.m
//  iMoods
//
//  Created by m2sar on 12/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import "MoodSelectionViewController.h"

@interface MoodSelectionViewController ()

@end

@implementation MoodSelectionViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UIBarButtonItem *but = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(saveMoodAndGoBack:)];
        [[self navigationItem] setRightBarButtonItem:but];
        [but release];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setView:[[[MoodSelectionView alloc] initWithFrame:[[self view] bounds]] autorelease]]; //We need more crochet!!
    //[self view]
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) saveMoodAndGoBack:(id)obj{
    if ([[self view] class] == [MoodSelectionView class]) {
        UIPickerView *picker = [[self view] picker];
        NSLog(@"index %d", [picker selectedRowInComponent:0]);
        NSString *mood = [[MoodSelectionView moods] objectAtIndex:[picker selectedRowInComponent:0]];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"moodChanged" object:mood];
        [[self navigationController] popToRootViewControllerAnimated:YES]
        ;
        NSLog(@"nouvelle humeur : %@", mood);
    }else{
        NSLog(@"Si on arrive ici, c'est que ça bug.");
    }
    
}

@end
