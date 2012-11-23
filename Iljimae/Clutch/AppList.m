#import "AppList.h"

NSArray * get_application_list(BOOL sort) {
	NSString *basePath = @"/var/mobile/Applications/";
	NSMutableArray *returnArray = [[NSMutableArray alloc] init];
	NSArray *apps = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:basePath error:NULL];
	
	if ([apps count] == 0) {
		NSLog(@"no apps here.. probably running in simulator!");
        return NULL;
	}
	
	NSEnumerator *e, *e2;
	e = [apps objectEnumerator];
	NSString *applicationDirectory;
	NSString *applicationSubdirectory;
    NSString *applicationIcon;
    NSString *applicationVersion;
    NSDictionary *info;
    
	NSMutableDictionary *cache = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/cache/clutch.plist"];
	BOOL cflush = FALSE;
	if ((cache == nil) || (![cache count])) {
		cache = [NSMutableDictionary dictionary];
		cflush = TRUE;
	}
	
	NSDictionary *applicationDetailObject;
	NSString *bundleDisplayName, *applicationRealname;
	
	while (applicationDirectory = [e nextObject]) {
		if ([cache objectForKey:applicationDirectory] != nil) {
			[returnArray addObject:[cache objectForKey:applicationDirectory]];
		} else {
			NSArray *sandboxPath = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[basePath stringByAppendingFormat:@"%@/", applicationDirectory] error:NULL];
			
			e2 = [sandboxPath objectEnumerator];
			while (applicationSubdirectory = [e2 nextObject]) {
				if ([applicationSubdirectory rangeOfString:@".app"].location == NSNotFound)
					continue;
				else {
                    info = [NSDictionary dictionaryWithContentsOfFile:[basePath stringByAppendingFormat:@"%@/%@/Info.plist", applicationDirectory, applicationSubdirectory]]; 
					bundleDisplayName = [info objectForKey:@"CFBundleDisplayName"];
                    applicationIcon = [basePath stringByAppendingFormat:@"%@/%@/%@", applicationDirectory, applicationSubdirectory, [info objectForKey:@"CFBundleIconFile"]];
                    applicationVersion = [info objectForKey:@"CFBundleVersion"];
					applicationRealname = [applicationSubdirectory stringByReplacingOccurrencesOfString:@".app" withString:@""];
					
					if (bundleDisplayName == nil) {
						bundleDisplayName = applicationRealname;
					}
                    NSLog(@"new app bros: %@", bundleDisplayName);
                    
					if ([[NSFileManager defaultManager] fileExistsAtPath:[basePath stringByAppendingFormat:@"%@/%@/SC_Info/", applicationDirectory, applicationSubdirectory]]) {
						applicationDetailObject = [NSDictionary dictionaryWithObjectsAndKeys:
                                                   [basePath stringByAppendingFormat:@"%@/", applicationDirectory], @"ApplicationBaseDirectory",
                                                   [basePath stringByAppendingFormat:@"%@/%@/", applicationDirectory, applicationSubdirectory], @"ApplicationDirectory",
                                                   bundleDisplayName, @"ApplicationDisplayName",
                                                   applicationRealname, @"ApplicationName",
                                                   applicationSubdirectory, @"ApplicationBasename",
                                                   applicationDirectory, @"RealUniqueID",
                                                   applicationIcon, @"ApplicationIcon",
                                                   applicationVersion, @"ApplicationVersion",
                                                   nil];
						[returnArray addObject:applicationDetailObject];
						[cache setValue:applicationDetailObject forKey:applicationDirectory];
						cflush = TRUE;
                        NSLog(@"application detail %@", applicationDetailObject);
					}
				}
			}
		}
	}
	
	if (cflush) {
		[cache writeToFile:@"/var/cache/clutch.plist" atomically:TRUE];
	}
	
	if ([returnArray count] == 0)
		return NULL;
	
	if (sort)
		return (NSArray *)[returnArray sortedArrayUsingFunction:alphabeticalSort context:NULL];
	return (NSArray *) returnArray;
}

NSComparisonResult alphabeticalSort(id one, id two, void *context) {
	return [[(NSDictionary *)one objectForKey:@"ApplicationName"] localizedCaseInsensitiveCompare:[(NSDictionary *)two objectForKey:@"ApplicationName"]];
}

