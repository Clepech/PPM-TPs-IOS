//
//  ContactAnnotation.h
//  ISouvenir
//
//  Created by m2sar on 08/12/2013.
//  Copyright (c) 2013 m2sar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ContactAnnotation : NSObject<MKAnnotation>{
    
}

- (id) initWithTitle:(NSString*)tit andCoordinate:(CLLocationCoordinate2D)coor;
@property (nonatomic, readwrite, copy) NSString *subtitle;
@end
