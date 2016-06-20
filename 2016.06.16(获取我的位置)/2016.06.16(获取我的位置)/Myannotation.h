//
//  Myannotation.h
//  2016.06.16(获取我的位置)
//
//  Created by 顾明轩 on 16/6/16.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Myannotation : NSObject<MKAnnotation>
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;

-(instancetype)initWithCoordinate:(CLLocationCoordinate2D)_coord;
@end
