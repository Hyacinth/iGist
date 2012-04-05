//
//  Gist.h
//  GistManager
//
//  Created by David Keegan on 12/9/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gist : NSObject {
    NSDate *created;
    NSString *description, *owner, *repository,*ftype;
    NSDictionary *files;
    BOOL public;
    
    NSDictionary *fileCache;
    NSDictionary *ftypeCache;
    NSMutableDictionary *textCache;
}

@property (nonatomic, retain) NSDate *created;
@property (nonatomic, copy) NSString *description, *owner, *repository,*ftype;
@property (nonatomic, retain) NSDictionary *files;
@property BOOL public;

//- (id)initWithDictionary:(NSDictionary *)aDictionary;
- (id)initWithRepository:(NSString *)aRepository;

- (NSArray *)fullURLs;
- (NSString *)textForURL:(NSURL *)url;
- (NSString *)cachedTextForFile:(NSString *)file;
- (NSArray *)ftypeList;
- (NSString *)firstFileName;
- (NSString *)objectFromFirstFile:(NSString*)key;

- (NSURL *)repositoryURL;
- (void)openRepositoryURL;

@end
