//
//  ViewController.h
//  ISouvenir
//
//  Created by m2sar on 08/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainView.h"
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController : UIViewController<ABPeoplePickerNavigationControllerDelegate, UIPopoverControllerDelegate>{
    MainView *mainView;
    ABPeoplePickerNavigationController *ABcont;
    UIPopoverController *popCtrl;
    BOOL isIPad;
}

@end
