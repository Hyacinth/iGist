//
//  Gist.m
//  GistManager
//
//  Created by David Keegan on 12/9/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import "Gist.h"
#import <JSON/JSON.h>

@implementation Gist

@synthesize created;
@synthesize description, owner, repository,ftype;
@synthesize files;
@synthesize public;

- (void)setPropertiesFromDictionary:(NSDictionary *)aDictionary{
    //2010/10/04 20:04:38 -0700
    //TODO: this is returning null
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] initWithDateFormat:@"yyyy/MM/dd hh:mm:ss" 
                                                         allowNaturalLanguage:NO];    
    NSLog(@"created at: %@", [aDictionary objectForKey:@"created_at"]);
    self.created = [dateFormat dateFromString:[aDictionary objectForKey:@"created_at"]];
    self.description = [aDictionary objectForKey:@"description"];
    self.owner = [aDictionary objectForKey:@"user"];
    self.files = [aDictionary objectForKey:@"files"];
    self.public = [[aDictionary objectForKey:@"public"] boolValue];
}

- (id)initWithRepository:(NSString *)aRepository{
    self = [super init];
    if(self != nil){
        NSError *error;
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.github.com/gists/%@", aRepository]];

        NSDictionary *data = (NSDictionary *)[[SBJsonParser alloc] objectWithString:[NSString initFromUrl:url] error:&error];
        [self setPropertiesFromDictionary:data];
        [self cachedTextForFile:[self firstFileName]];
    }
    self.repository = aRepository;
    return self;
}

- (NSString *)objectFromFirstFile:(NSString*)key {
    NSArray *keys = [self.files allKeys];
    id aKey = [keys objectAtIndex:0];
    return [[self.files objectForKey:aKey] objectForKey:key];
}

- (NSString *)firstFileName {
    NSArray *keys = [self.files allKeys];
    id aKey = [keys objectAtIndex:0];
    return [[self.files objectForKey:aKey] objectForKey:@"filename"];
}

- (NSURL *)repositoryURL{
    NSString *url = [NSString stringWithFormat:@"http://gist.github.com/%@", self.repository];
    return [NSURL URLWithString:url];
}

- (void)openRepositoryURL{
    [[NSWorkspace sharedWorkspace] openURL:[self repositoryURL]];
}

- (NSString *)cachedTextForFile:(NSString *)file{    
    return [self.files objectForKey:file];
}

@end
