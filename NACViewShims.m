//
//  ViewShims.m
//
//  Created by Nathan Cooper on 2015-04-15.
//

#import "NACViewShims.h"
#import "NACAlertActionCallbackDelegate.h"
#import "UIAlertView+MKBlocKAdditions.h"

@implementation NACViewShims

//ACTION SHIMS

+ (void) showActionViewWithTitle:(NSString*)title withDelegate:(NACAlertActionCallbackDelegate*)delegate withOptionTitles:(NSArray *) optionTitles {
    if ([UIAlertController class]){
        //New >= 8.0 Style.
        UIAlertController *dialog = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
        int i = 0;
        for (NSString *title in optionTitles){
            UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                delegate.callback(i);
            }];
            [dialog addAction: action];
            i++;
        }
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
        [dialog addAction: cancel];
        [delegate.controller presentViewController:dialog animated:YES completion:nil];
    }
    else {
        //Old < 8.0 Style.
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Account Options" delegate:delegate cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
        for (NSString *title in optionTitles){
            [actionSheet addButtonWithTitle:title];
        }
        [actionSheet addButtonWithTitle:@"Cancel"];
        [actionSheet showInView:delegate.controller.view];
    }
}

//CONFIRM SHIM

+ (void) showConfirmationWithTitle:(NSString*)title withMessage:(NSString*) message fromController:(UIViewController*) controller withConfirmText:(NSString*)confirmText withCancelText:(NSString *)cancelText withConfirmAction:(void (^)(void))confirmAction withCancellationAction:(void(^)(void)) cancellationAction {
    if ([UIAlertController class]){
        //New >= 8.0 Style.
        UIAlertController *dialog = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:confirmText style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            confirmAction();
        }];
        [dialog addAction:confirm];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelText style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            cancellationAction();
        }];
        [dialog addAction: cancel];
        [controller presentViewController:dialog animated:YES completion:nil];
    }
    else {
        //Old < 8.0 Style.
        [UIAlertView alertViewWithTitle:title message: message cancelButtonTitle:cancelText otherButtonTitles:@[confirmText] onDismiss:^(int buttonIndex) {
            confirmAction();
        } onCancel:^{
        	cancellationAction();
        }];
    }
}

+ (void) showConfirmationWithTitle:(NSString*)title withMessage:(NSString*) message fromController:(UIViewController*) controller withConfirmText:(NSString*)confirmText withCancelText:(NSString *)cancelText withConfirmAction:(void (^)(void))confirmAction {
    [NACViewShims showConfirmationWithTitle:title withMessage:message fromController:controller withConfirmText:confirmText withCancelText:cancelText withConfirmAction: confirmAction withCancellationAction:^{
    	//Do nothing
    }];
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
    [NACViewShims showHelperWithTitle:@"Error" withMessage:[errors count] <= 1 ? errors[0] : [NACViewShims alertViewMessageForErrorList:errors] fromController:controller];
}

+ (void) showAlertForSuccesses:(NSArray *)messages fromViewController:(UIViewController *)controller {
    [NACViewShims showHelperWithTitle:@"Success" withMessage:[messages count] <= 1 ? messages[0] : [NACViewShims alertViewMessageForErrorList:messages] fromController:controller];
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
