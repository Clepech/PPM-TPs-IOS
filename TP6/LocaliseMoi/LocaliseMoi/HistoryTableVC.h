//
//  HistoryTableVC.h
//  LocaliseMoi
//
//  Created by m2sar on 08/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressCell.h"
#import "MapViewController.h"

@interface HistoryTableVC : UITableViewController <UISplitViewControllerDelegate>

@property (nonatomic, readwrite, retain) MapViewController *mapVC;

//- (void)addAddress:(AddressCell*)addr;
@end
