//
//  PMODownloadTaskQueueManager.m
//  PMODownloadManager
//
//  Created by Peter Molnar on 10/04/2016.
//  Copyright © 2016 Peter Molnar. All rights reserved.
//

#import "PMODownloadTaskQueueManager.h"

@interface PMODownloadTaskQueueManager()

@property (strong, nonatomic) NSMutableArray *normalPriorityQueue;
@property (strong, nonatomic) NSMutableArray *highPriorityQueue;


@end

@implementation PMODownloadTaskQueueManager

#pragma mark - Accessors

- (NSMutableArray *)normalPriorityQueue
{
    if (!_normalPriorityQueue) {
        _normalPriorityQueue = [[NSMutableArray alloc] init];
    }
    
    return _normalPriorityQueue;
}



#pragma mark - Public interface implementation

-(void)addDownloadTaskToNormalPriorityQueue:(NSURLSessionTask *)task
{
    [self.normalPriorityQueue addObject:task];
    [self startTask:task];
}

-(void)suspendNormalPriorityQueue
{
    for (NSURLSessionTask *currentTask in self.normalPriorityQueue) {
        [self suspendTask:currentTask];
    }
}

-(void)resumeNormalPriorityQueue
{
    for (NSURLSessionTask *currentTask in self.normalPriorityQueue) {
        [self startTask:currentTask];
    }
   
}

-(void)addDownloadTaskToHighPriorityQueue:(NSURLSessionTask *)task
{
    
}

#pragma mark - Private functions

-(void)startTask:(NSURLSessionTask *)task
{
    if (self.isDebug) {
        NSLog(@"Task started: %@",task.currentRequest.URL);
    }
    [task resume];
    
}

-(void)suspendTask: (NSURLSessionTask *)task
{
    if (self.isDebug) {
        NSLog(@"Task startsuspended: %@",task.currentRequest.URL);
    }

    [task suspend];
}




@end
