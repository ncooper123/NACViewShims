//
//  NACAlertActionCallbackDelegate.h
//
//  Created by Nathan Cooper on 2015-04-15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NACAlertActionCallbackDelegate : NSObject <UIActionSheetDelegate>

- (id) initWithCallback:(void(^)(int)) callback;

@end
