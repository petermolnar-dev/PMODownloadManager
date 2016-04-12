//
//  PMODownloadTaskQueueManager.h
//  PMODownloadManager
//
//  Created by Peter Molnar on 10/04/2016.
//  Copyright © 2016 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMODownloadTaskQueueManager : NSObject

@property (assign, nonatomic) BOOL isDebug;

- (void)addDownloadTaskToNormalPriorityQueue: (NSURLSessionTask *)task;
- (void)addDownloadTaskToHighPriorityQueue: (NSURLSessionTask *)task;
- (void)removeAllTasksFromHighPriorityQueue;


- (void)suspendNormalPriorityQueue;
- (void)resumeNormalPriorityQueue;
@end
