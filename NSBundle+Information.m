//
//  NSBundle+Information.m
//  chromifier
//
//  Created by Evadne Wu on 5/6/10.
//  Copyright 2010 iridia. All rights reserved.
//

#import "NSBundle+Information.h"


@implementation NSBundle (Information)





- (NSImage *) bundleIcon {

	if ([self bundleIconPath]) return [[NSImage alloc] initWithContentsOfFile:[self bundleIconPath]];
	
	BOOL isMainBundle = (self == [NSBundle mainBundle]);

	NSString *fileType = nil;
	
	if (floor(NSAppKitVersionNumber) <= NSAppKitVersionNumber10_5) {

		fileType = isMainBundle ? NSFileTypeForHFSTypeCode(kGenericApplicationIcon) : @".bundle";

	} else {
	
		fileType = isMainBundle ? (NSString*)kUTTypeApplication : (NSString*)kUTTypeBundle;
	
	}
	
	return [[NSWorkspace sharedWorkspace] iconForFileType:fileType];

}





- (NSString *) bundleIconPath {

	NSString *iconPath = [self pathForResource:[self objectForInfoDictionaryKey: @"CFBundleIconFile"] ofType:@"icns"];
	if (iconPath) return iconPath;
	
	iconPath = [self pathForResource:[self objectForInfoDictionaryKey:@"CFBundleIconFile"] ofType:nil];
	if (iconPath) return iconPath;

	return nil;
	
}

- (NSString *) bundleName {

	NSString *name = [self objectForInfoDictionaryKey:@"CFBundleDisplayName"];
	if (name) return name;

	name = [self objectForInfoDictionaryKey:@"CFBundleName"];
	if (name) return name;

	return [[[NSFileManager defaultManager] displayNameAtPath:[self bundlePath]] stringByDeletingPathExtension];

}





- (NSString *) bundleVersion {

	return [self objectForInfoDictionaryKey:@"CFBundleVersion"];

}





- (NSString *) bundleDisplayVersion {

	NSString *shortVersionString = [self objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
	if (shortVersionString) return shortVersionString;
	return nil;

}





@end
