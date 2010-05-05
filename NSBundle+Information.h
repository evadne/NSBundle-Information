//
//  NSBundle+Information.h
//  chromifier
//
//  Created by Evadne Wu on 5/6/10.
//  Copyright 2010 iridia. All rights reserved.
//

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#include <Cocoa/Cocoa.h>
#endif





@interface NSBundle (Information)

- (NSImage *) bundleIcon;
- (NSString *) bundleIconPath;
- (NSString *) bundleName;
- (NSString *) bundleVersion;
- (NSString *) bundleDisplayVersion;

@end
