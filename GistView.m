//
//  GistView.m
//  Gister
//
//  Created by David Keegan on 12/12/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import "AppDelegate.h"
#import "GistView.h"

@implementation GistView

@synthesize gist;
@synthesize description;
@synthesize repo;


- (void)awakeFromNib{
    [[self.description cell] setBackgroundStyle:NSBackgroundStyleRaised];
    self.description.stringValue = @"";
}

- (void)updateWithGist:(Gist *)aGist{
    self.gist = aGist;
    NSString *rawString = [self.gist objectFromFirstFile:@"content"];

    [[NSApp delegate] setTextViewWithString: rawString];   
    [[NSApp delegate] setSyntaxDefinition: [self.gist objectFromFirstFile:@"language"]];       
    self.description.stringValue = self.gist.description;
    self.repo.stringValue = self.gist.repository;
}

- (IBAction)copyFile:(id)sender{
    NSString *rawString = [self.gist cachedTextForFile:[self.gist.files objectAtIndex:0]];
    
    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
    [pasteboard declareTypes:[NSArray arrayWithObject:NSStringPboardType] owner:nil];
    [pasteboard setString:rawString forType:NSStringPboardType];    
}

- (IBAction)saveFile:(id)sender{
    NSSavePanel *savePanel = [NSSavePanel savePanel];
#if MAC_OS_X_VERSION_10_6 && MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_6    
    if([savePanel respondsToSelector:@selector(setNameFieldStringValue:)]){
        [savePanel setNameFieldStringValue:[self.gist.files objectAtIndex:0]];
    }
#endif    
    if([savePanel runModal] == NSOKButton){
        NSError *error;
        NSString *rawString = [self.gist cachedTextForFile:[self.gist.files objectAtIndex:0]];
        NSString *selectedFile = [savePanel filename];
        [rawString writeToFile:selectedFile atomically:YES encoding:NSUTF8StringEncoding error:&error];
    }         
}

@end
