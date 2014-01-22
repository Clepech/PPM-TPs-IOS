//
//  AddressCell.h
//  LocaliseMoi
//
//  Created by m2sar on 10/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AddressCell : NSObject <NSCoding>

@property (nonatomic, readonly, retain) NSString *name;
@property (nonatomic, readonly) CLLocationCoordinate2D coord;

- (id)initWithName:(NSString*)name andCoordinates:(CLLocationCoordinate2D)coord;

@end
