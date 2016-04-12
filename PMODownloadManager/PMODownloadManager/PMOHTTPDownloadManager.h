//
//  PMOHTTPDowloadManager.h
//  Parallels_test2
//
//  Created by Peter Molnar on 06/04/2016.
//  Copyright © 2016 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger) {
    NormalPriorityQueue,
    HighPriorityQueue
} DownloadQueuePriorities;

@interface PMOHTTPDownloadManager : NSObject

-(void)startNewDataTaskWithURLAsString:(NSString *)urlAsString downloadPriority:(DownloadQueuePriorities) priority;

@end
