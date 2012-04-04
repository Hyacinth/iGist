//
//  FragariaAppDelegate.h
//  Fragaria
//
//  Created by Jonathan on 30/04/2010.
//  Copyright 2010 mugginsoft.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GistManager.h"


@class SMLTextView;
@class MGSFragaria;

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	IBOutlet NSView *editView;
	MGSFragaria *fragaria;
	BOOL isEdited;
    
    NSOutlineView *listView;
   // GistView *gistView;
    NSArray *gists;
}

- (IBAction)copyToPasteBoard:(id)sender;

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSOutlineView *listView;
//@property (assign) IBOutlet GistView *gistView;
@property (nonatomic, retain) NSArray *gists;


- (void)setSyntaxDefinition:(NSString *)name;
- (NSString *)syntaxDefinition;

@end

@interface AppDelegate(GistList)

@end

@interface AppDelegate(Actions)

- (IBAction)refreshAction:(id)sender;
- (IBAction)openGithubAction:(id)sender;

@end
