//
//  MapViewController.h
//  LocaliseMoi
//
//  Created by m2sar on 08/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapView.h"
#import "MyTools.h"
#import "AddressCell.h"

@interface MapViewController : UIViewController<UITextViewDelegate, NSURLConnectionDelegate,NSURLConnectionDataDelegate, NSXMLParserDelegate>

- (void)goTo:(AddressCell *)addr;
@end
