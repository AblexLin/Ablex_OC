//
//  AppDelegate.h
//  2016.06.07(CoreData)
//
//  Created by 顾明轩 on 16/6/7.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

//这个主要目的就是如何把对象保存到数据库里去

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//托管的对象上下文和之前的db类似
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//托管的模型和之前的table类似
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//持久化存储协调者
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
//保存上下文
- (void)saveContext;
//获取当前沙盒或者说应用程序的doc路径，注意，返回的是一个url
- (NSURL *)applicationDocumentsDirectory;


@end

