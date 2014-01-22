//
//  AddressCell.m
//  LocaliseMoi
//
//  Created by m2sar on 10/01/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import "AddressCell.h"

#define KEY1 @"nameOfAddress"
#define KEY2 @"latitude"
#define KEY3 @"longitute"

@implementation AddressCell

- (id)initWithName:(NSString*)name andCoordinates:(CLLocationCoordinate2D)coord
{
    self = [super init];
    if (self) {
        _name = name;
        _coord = coord;
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder{
    _name = [aDecoder decodeObjectForKey:KEY1];
    _coord.latitude = [aDecoder decodeDoubleForKey:KEY2];
    _coord.longitude = [aDecoder decodeDoubleForKey:KEY3];
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:KEY1];
    [aCoder encodeDouble:_coord.latitude forKey:KEY2];
    [aCoder encodeDouble:_coord.longitude forKey:KEY3];
}

@end
