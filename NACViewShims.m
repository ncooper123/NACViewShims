//
//  ViewShims.m
//
//  Created by Nathan Cooper on 2015-04-15.
//

#import "NACViewShims.h"
#import "AlertActionCallbackDelegate.h"
#import "UIAlertView+MKBlocKAdditions.h"

@implementation NACViewShims

//ACTION SHIMS

+ (void) showActionViewWithTitle:(NSString*)title fromController:(UIViewController*) controller withOptionTitles:(NSArray *) optionTitles withCallback:(void(^)(int)) callback {
    if ([UIAlertController class]){
        //New >= 8.0 Style.
        UIAlertController *dialog = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
        int i = 0;
        for (NSString *title in optionTitles){
            UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                callback(i);
            }];
            [dialog addAction: action];
            i++;
        }
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
        [dialog addAction: cancel];
        [controller presentViewController:dialog animated:YES completion:nil];
    }
    else {
        //Old < 8.0 Style.
        NACAlertActionCallbackDelegate *delegate = [[NACAlertActionCallbackDelegate alloc] initWithCallback:callback];
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Account Options" delegate:delegate cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:nil];
        for (NSString *title in optionTitles){
            [actionSheet addButtonWithTitle:title];
        }
        [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
    }
}

//CONFIRM SHIM

+ (void) showConfirmationWithTitle:(NSString*)title withMessage:(NSString*) message fromController:(UIViewController*) controller withConfirmText:(NSString*)confirmText withCancelText:(NSString *)cancelText withConfirmAction:(void (^)())confirmAction {
    if ([UIAlertController class]){
        //New >= 8.0 Style.
        UIAlertController *dialog = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:confirmText style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            confirmAction();
        }];
        [dialog addAction:confirm];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelText style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
        }];
        [dialog addAction: cancel];
        [controller presentViewController:dialog animated:YES completion:nil];
    }
    else {
        //Old < 8.0 Style.
        [UIAlertView alertViewWithTitle:title message: message cancelButtonTitle:cancelText otherButtonTitles:@[confirmText] onDismiss:^(int buttonIndex) {
            confirmAction();
        } onCancel:^{ /*Do Nothing*/ }];
    }
}

//MESSAGES SHIM

+ (void) showHelperWithTitle:(NSString*)title withMessage:(NSString*) message fromController:(UIViewController *)controller {
    if([UIAlertController class]){
        //New >= 8.0 Style.
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
        [alertView addAction: ok];
        [controller presentViewController:alertView animated:YES completion:nil];
    }
    else {
        //Old < 8.0 Style.
        [UIAlertView alertViewWithTitle:title message:message];
    }
}

+ (void) showAlertForErrors:(NSArray *)errors fromViewController:(UIViewController *)controller {
    [ViewShims showHelperWithTitle:@"Error" withMessage:[errors count] <= 1 ? errors[0] : [ViewShims alertViewMessageForErrorList:errors] fromController:controller];
}

+ (void) showAlertForSuccesses:(NSArray *)messages fromViewController:(UIViewController *)controller {
    [ViewShims showHelperWithTitle:@"Success" withMessage:[messages count] <= 1 ? messages[0] : [ViewShims alertViewMessageForErrorList:messages] fromController:controller];
}

+ (NSString*) alertViewMessageForErrorList:(NSArray *) errors {
    NSString *str = @"";
    NSString *bullet = [NSString stringWithFormat:@"%C", (unichar) 0x2022];
    for (NSString *error in errors){
        str = [NSString stringWithFormat:@"%@\n%@ %@",str,bullet,error];
    }
    return str;
}


@end
