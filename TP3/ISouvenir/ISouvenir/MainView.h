//
//  MainView.h
//  ISouvenir
//
//  Created by m2sar on 08/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface MainView : UIView<MKMapViewDelegate>{
    bool isIPad;
    bool isIos6;
    int count;
    UIImageView *background;
    UIButton *souvenirBut;
    //UIButton *contactBut;
    MKMapView *mapView;
    UIPopoverController *pop;
    ABAddressBookRef *ab;
    ABPeoplePickerNavigationController *ABcont;
}

@property (nonatomic, readonly) UIButton *contactBut;
@property (nonatomic, readonly) MKMapView *mapView;
- (void) UpdateFrames:(UIInterfaceOrientation) o;
- (void) linkPerson:(ABRecordRef)person;
- (CGRect)MakePopUpFrame;
@end
