//
//  AlertActionCallbackDelegate.m
//
//  Created by Nathan Cooper on 2015-04-15.
//

#import "NACAlertActionCallbackDelegate.h"

typedef void (^AlertCallback)(int);

@interface NACAlertActionCallbackDelegate ()

@property(readwrite,copy) NACAlertCallback callback;

@end

@implementation NACAlertActionCallbackDelegate

- (id) initWithCallback:(void(^)(int)) callback {
    if (self = [super init]){
        self.callback = callback;
    }
    return self;
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.callback(buttonIndex);
}

@end
