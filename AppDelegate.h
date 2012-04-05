//
//  FragariaAppDelegate.h
//  Fragaria
//
//  Created by Jonathan on 30/04/2010.
//  Copyright 2010 mugginsoft.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GistManager.h"
#import "GistView.h"

@class SMLTextView;
@class MGSFragaria;

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window, *preferencesWindow;
	IBOutlet NSView *editView;
	MGSFragaria *fragaria;
	BOOL isEdited;
    NSView *textView;
    NSOutlineView *listView;
    GistView *gistView;
    NSArray *gists;
}

- (void)refresh;
- (void)setTextViewWithString:(NSString *) string;

@property (assign) IBOutlet NSWindow *window, *preferencesWindow;
@property (assign) IBOutlet NSOutlineView *listView;
@property (assign) IBOutlet GistView *gistView;
@property (nonatomic, retain) NSArray *gists;
@property (assign) IBOutlet NSView *textView;
@property (nonatomic, retain) MGSFragaria *frageria;

- (void)setSyntaxDefinition:(NSString *)name;
- (NSString *)syntaxDefinition;

@end

@interface AppDelegate(GistList)

@end

@interface AppDelegate(Actions)
//- (IBAction)copyToPasteBoard:(id)sender;
- (IBAction)showPreferences:(id)sender;
- (IBAction)refreshAction:(id)sender;
- (IBAction)openGithubAction:(id)sender;

@end
