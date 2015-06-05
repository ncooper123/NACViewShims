//
//  NACAlertActionCallbackDelegate.h
//
//  Created by Nathan Cooper on 2015-04-15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NACAlertActionCallbackDelegate.h"

typedef void (^NACAlertCallback)(int);

@interface NACAlertActionCallbackDelegate : NSObject <UIActionSheetDelegate>

- (id) initWithCallback:(void(^)(int)) callback withController:(UIViewController*)controller;

@property(readwrite,copy) NACAlertCallback callback;
@property(strong,nonatomic) UIViewController *controller;

@end
