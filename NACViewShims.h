//
//  NACViewShims.h
//
//  Created by Nathan Cooper on 2015-04-15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NACAlertActionCallbackDelegate.h"

@interface NACViewShims : NSObject

+ (void) showActionViewWithTitle:(NSString*)title withDelegate:(NACAlertActionCallbackDelegate*)delegate withOptionTitles:(NSArray *) optionTitles;
+ (void) showConfirmationWithTitle:(NSString*)title withMessage:(NSString*) message fromController:(UIViewController*) controller withConfirmText:(NSString*)confirmText withCancelText:(NSString *)cancelText withConfirmAction:(void (^)(void))confirmAction withCancellationAction:(void(^)(void)) cancellationAction;
+ (void) showConfirmationWithTitle:(NSString*)title withMessage:(NSString*) message fromController:(UIViewController*) controller withConfirmText:(NSString*)confirmText withCancelText:(NSString *)cancelText withConfirmAction:(void (^)(void))confirmAction;
+ (void) showAlertForSuccesses:(NSArray *)errors fromViewController:(UIViewController*)controller;
+ (void) showAlertForErrors:(NSArray *)errors fromViewController:(UIViewController *)controller;

@end
