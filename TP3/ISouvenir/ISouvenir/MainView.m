//
//  MainView.m
//  ISouvenir
//
//  Created by m2sar on 08/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "MainView.h"
#import "ContactAnnotation.h"
#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#define BARREH 50
#define MAPEDGE 15
#define BUTTONH 25
#define LITTLESPACE 5

@implementation MainView
@synthesize contactBut;
@synthesize mapView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    
    if (self) {       
        
        count = 0;
        // Test des version
        if  ([[[UIDevice currentDevice] systemVersion] characterAtIndex:(0)] == '6') {
            isIos6 = YES;
        }else{
            isIos6 = NO;
        }
        if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
            isIPad = NO;
        }else{
            isIPad = YES;
        }
    
    
        background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fond-2048x2048.jpg"]];
        [self addSubview:background];
        
        double curY = 0;
        if (!isIos6) {
            curY += 20;
        }
        
        souvenirBut = [[UIButton alloc] initWithFrame:CGRectMake(0, curY, frame.size.width, BUTTONH)];
        [souvenirBut setTitle:@"Se souvenir" forState:UIControlStateNormal];
        [souvenirBut addTarget:self action:@selector(markPlace:) forControlEvents:UIControlEventTouchUpInside];
        curY += BUTTONH;
        
        
        contactBut = [[UIButton alloc] initWithFrame:CGRectMake(0, curY, frame.size.width, BUTTONH)];
        [contactBut setTitle:@"Contact" forState:UIControlStateNormal];
        
        curY += BUTTONH;
        
        
        curY += LITTLESPACE;
        
        mapView = [[MKMapView alloc] initWithFrame:CGRectMake(MAPEDGE, curY, frame.size.width - 2 * MAPEDGE, frame.size.height - curY - MAPEDGE)];
        [mapView setDelegate:self];
        
        [mapView setCenterCoordinate:CLLocationCoordinate2DMake(48.846502,2.354658) animated:NO];
        [mapView setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake(48.846502,2.354658), MKCoordinateSpanMake(0.01, 0.01)) animated:YES];
        //[mapView]
        ContactAnnotation *annot = [[ContactAnnotation alloc] initWithTitle:@"Home, Sweet Home" andCoordinate:CLLocationCoordinate2DMake(48.846502,2.354658)];
        [mapView addAnnotation:annot];
        [annot release];
        
        //ab = ABAddressBookCreate();
        //ABrecordRef abRec =
        
        [self addSubview:souvenirBut];
        [self addSubview:contactBut];
        [self addSubview:mapView];
        [background release];
        [souvenirBut release];
        [contactBut release];
        [mapView release];
    }
    return self;
    
}

- (void) UpdateFrames:(UIInterfaceOrientation) o {
    double curY = 0;
    if (!isIos6) {
        curY += 20;
    }
    [souvenirBut setFrame:CGRectMake(0, curY, [self bounds].size.width, BUTTONH)];
    curY += BUTTONH;
    
    [contactBut setFrame:CGRectMake(0, curY, [self bounds].size.width, BUTTONH)];
    curY += BUTTONH;
    
    curY += LITTLESPACE;
    [mapView setFrame:CGRectMake(MAPEDGE, curY, [self bounds].size.width - 2 * MAPEDGE, [self bounds].size.height - curY - MAPEDGE)];
}

- (void) linkPerson:(ABRecordRef)person{
    //On suppose qu'il y a une unique annotation selectionnée
    if ([mapView selectedAnnotations]) {
        // TODO peut etre tester si tmp not null
        ContactAnnotation *tmp = (ContactAnnotation *) [[mapView selectedAnnotations] objectAtIndex:0];
        NSString* firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
        NSString* lastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
        [tmp setSubtitle:[NSString stringWithFormat:@"%@ %@", firstName, lastName]];
    }
}

- (void)markPlace:(id)sender{
    count++;
    ContactAnnotation *anno = [[ContactAnnotation alloc] initWithTitle:[NSString stringWithFormat:@"Some place #%d", count] andCoordinate:[mapView centerCoordinate]];
    [mapView addAnnotation:anno];
    [anno release];
}

#define POPUPEDGE 300

- (CGRect)MakePopUpFrame{
    double curY = 0;
    if (!isIos6) {
        curY += 20;
    }
    curY += BUTTONH;
    curY += BUTTONH;
    curY += LITTLESPACE;
    CGRect rect = CGRectMake(POPUPEDGE, curY, [self bounds].size.width - 2 * POPUPEDGE, 500);
    
    return rect;
}

- (void) dealloc{
    CFRelease(ab);
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
@end
