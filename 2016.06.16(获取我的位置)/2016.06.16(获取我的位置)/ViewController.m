//
//  ViewController.m
//  2016.06.16(获取我的位置)
//
//  Created by 顾明轩 on 16/6/16.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "Myannotation.h"

@interface ViewController ()<CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet MKMapView *map;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置地图上我的位置
    self.map.showsUserLocation=YES;
    //设定坐标
    CLLocationCoordinate2D coord=CLLocationCoordinate2DMake(39.962, 116.317);
    //创建一个区域,0.02是精度和纬度的比例，越小，显示范围越小
    MKCoordinateRegion region=MKCoordinateRegionMake(coord, MKCoordinateSpanMake(0.02, 0.02));
    //设定显示区域
    [self.map setRegion:region animated:YES];
    //初始化标准
    Myannotation *annotation=[[Myannotation alloc]initWithCoordinate:coord];
    //设置标题
    annotation.title=@"这里是轩爷的家";
    //设置字标题
    annotation.subtitle=@"首长我爱你";
    //增加标注，所谓标注，其实就是设置个大头针
    [self.map addAnnotation:annotation];
    
    //创建位置管理器对象
    CLLocationManager *lm=[[CLLocationManager alloc]init];
    //设定精度为最好的
    lm.desiredAccuracy=kCLLocationAccuracyBest;
    //设置更新距离，也就是移动多少酒更新
    lm.distanceFilter=10;
    //设置代理
    lm.delegate=self;
    //开始更新位置
    [lm startUpdatingLocation];
}

//位置更新事件
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    //需要到真机上才能看到效果
    CLLocation *location=[locations lastObject];
    NSLog(@"%F",location.coordinate.latitude);
    self.latitude.text=[NSString stringWithFormat:@"%f",location.coordinate.latitude];    //纬度
    self.longitude.text=[NSString stringWithFormat:@"%f",location.coordinate.longitude];  //精度
}

@end
