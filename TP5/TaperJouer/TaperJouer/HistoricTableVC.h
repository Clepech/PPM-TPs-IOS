//
//  HistoricTableVC.h
//  TaperJouer
//
//  Created by m2sar on 16/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerViewController.h"

@interface HistoricTableVC : UITableViewController <UISplitViewControllerDelegate>

@property (nonatomic, readwrite, retain) PlayerViewController *playerVC;


@end
