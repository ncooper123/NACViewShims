//
//  NACViewShims.h
//
//  Created by Nathan Cooper on 2015-04-15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NACViewShims : NSObject

+ (void) showActionViewWithTitle:(NSString*)title fromController:(UIViewController*) controller withOptionTitles:(NSArray *) optionTitles withCallback:(void(^)(int)) callback;
+ (void) showConfirmationWithTitle:(NSString*)title withMessage:(NSString*) message fromController:(UIViewController*) controller withConfirmText:(NSString*)confirmText withCancelText:(NSString *)cancelText withConfirmAction:(void (^)())confirmAction withCancellationAction:(void(^)()) cancellationAction;
+ (void) showConfirmationWithTitle:(NSString*)title withMessage:(NSString*) message fromController:(UIViewController*) controller withConfirmText:(NSString*)confirmText withCancelText:(NSString *)cancelText withConfirmAction:(void (^)())confirmAction;
+ (void) showAlertForSuccesses:(NSArray *)errors fromViewController:(UIViewController*)controller;
+ (void) showAlertForErrors:(NSArray *)errors fromViewController:(UIViewController *)controller;

@end
