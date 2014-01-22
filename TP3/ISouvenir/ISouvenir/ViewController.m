//
//  ViewController.m
//  ISouvenir
//
//  Created by m2sar on 08/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    mainView = [[MainView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self setView:mainView];
    [[mainView contactBut] addTarget:self action:@selector(showAB:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    //On ne veut pas gérer la rotation
    //[mainView UpdateFrames:fromInterfaceOrientation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    
    if (isIPad) {
        [popCtrl dismissPopoverAnimated:YES];
        [popCtrl release];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person{
    [mainView linkPerson:person];
    if (isIPad) {
        [popCtrl dismissPopoverAnimated:YES];
        [popCtrl release];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    return NO;
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    return NO;
}

#define POPUPEDGE 300

- (void)showAB:(id)sender{
    if ([[mainView mapView] selectedAnnotations]) {
        
        if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
            isIPad = NO;
        }else{
            isIPad = YES;
        }
        
        ABcont = [[ABPeoplePickerNavigationController alloc] init];
        [ABcont setPeoplePickerDelegate:self];
        popCtrl = [[UIPopoverController alloc] initWithContentViewController:ABcont];
        [popCtrl setDelegate:self];
        if (isIPad) {
            popCtrl = [[UIPopoverController alloc] initWithContentViewController:ABcont];
            // Frame fabriqué "en dur" : c'est bof
            //[popCtrl autorelease];
            [popCtrl presentPopoverFromRect:CGRectMake( [mainView bounds].size.width /2 , 65,0 , 0) inView:mainView permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
            
        }else{
            [self presentViewController:ABcont animated:YES completion:nil];
        }
        
        [ABcont release];
    }else{
        
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Erreur" message:@"Selectionne un lieu" delegate:self cancelButtonTitle:@"OKAAAAAAY"otherButtonTitles: nil];
        [av autorelease];
        [av show];
    }
}


@end
