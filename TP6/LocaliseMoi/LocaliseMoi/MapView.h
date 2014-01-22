//
//  MapView.h
//  LocaliseMoi
//
//  Created by m2sar on 08/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapView : UIView

@property (nonatomic, readonly, retain) UITextView *text;
@property (nonatomic, readonly, retain) MKMapView *map;

- (void)setOrientation;
@end
