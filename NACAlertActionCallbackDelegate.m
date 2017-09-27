//
//  AlertActionCallbackDelegate.m
//
//  Created by Nathan Cooper on 2015-04-15.
//

#import "NACAlertActionCallbackDelegate.h"

@implementation NACAlertActionCallbackDelegate

- (id) initWithCallback:(void(^)(int)) callback withController:(UIViewController*)controller{
    if (self = [super init]){
        self.controller = controller;
        self.callback = callback;
    }
    return self;
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.callback((int)buttonIndex);
}

@end
