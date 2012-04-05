//
//  AppDelegate+Actions.m
//  Gister
//
//  Created by David Keegan on 12/13/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate(Actions)

- (IBAction)refreshAction:(id)sender{
    [self refresh];
}


- (IBAction)openGithubAction:(id)sender{
    [self.gistView.gist openRepositoryURL];
}

- (BOOL)validateUserInterfaceItem:(id<NSValidatedUserInterfaceItem>)anItem{
    SEL action = [anItem action];
    if(action == @selector(openGithubAction:)){
        return (self.gistView.gist != nil);
    }
    return YES;
}

- (IBAction)showPreferences:(id)sender {
    [self.preferencesWindow makeKeyAndOrderFront:self];
}

#pragma mark -
#pragma mark Pasteboard handling
/*
 
 copyToPasteBoard
 
 */
/*
- (IBAction)copyToPasteBoard:(id)sender
{
#pragma unused(sender)
	
	NSAttributedString *attString = [fragaria attributedString];
	NSData *data = [attString RTFFromRange:NSMakeRange(0, [attString length]) documentAttributes:nil];
	NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
	[pasteboard clearContents];
	[pasteboard setData:data forType:NSRTFPboardType];
}
*/

@end
