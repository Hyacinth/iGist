//
//  GistView.h
//  Gister
//
//  Created by David Keegan on 12/12/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GistManager.h"


@interface GistView : NSView {
    Gist *gist;
    NSTextField *description;
    NSTextField *repo;

}

@property (nonatomic, retain) Gist *gist;
@property (assign) IBOutlet NSTextField *description;
@property (assign) IBOutlet NSTextField *repo;

- (void)updateWithGist:(Gist *)aGist;

- (IBAction)copyFile:(id)sender;
- (IBAction)saveFile:(id)sender;




@end
