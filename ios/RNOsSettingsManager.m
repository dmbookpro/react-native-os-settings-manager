//
//  RNOsSettingsManager.m
//  RNOsSettingsManager
//
//  Created by Théo on 03/08/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "RNOsSettingsManager.h"
#import <UIKit/UIKit.h>
#import <React/RCTLog.h>

@implementation RNOsSettingsManager

RCT_EXPORT_MODULE(RNOsSettingsManager);

RCT_EXPORT_METHOD(areNotificationsEnabled:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    UIUserNotificationSettings *grantedSettings = [[UIApplication sharedApplication] currentUserNotificationSettings];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];

    if ( grantedSettings.types & UIUserNotificationTypeBadge ){
        // Badge permission
        [dict setValue:@true forKey:@"badge"];
    }
    if ( grantedSettings.types & UIUserNotificationTypeAlert ){
        // Alert permission
        [dict setValue:@true forKey:@"alert"];
    }
    if ( grantedSettings.types & UIUserNotificationTypeAlert ){
        // Sound permission
        [dict setValue:@true forKey:@"sound"];
    }
    resolve(dict);
}

RCT_EXPORT_METHOD(openAppSettings)
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

@end
