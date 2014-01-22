//
//  ContactAnnotation.m
//  ISouvenir
//
//  Created by m2sar on 08/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import "ContactAnnotation.h"
#import <MapKit/MapKit.h>

@implementation ContactAnnotation
@synthesize title;
@synthesize coordinate;

- (id) initWithTitle:(NSString*)tit andCoordinate:(CLLocationCoordinate2D)coor{
    title = tit;
    coordinate = coor;
    return self;
}

- (void) setCoordinate:(CLLocationCoordinate2D)newCoordinate{
    coordinate = newCoordinate;
}
@end
