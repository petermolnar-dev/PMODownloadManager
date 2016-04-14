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

- (NSMutableArray *)highPriorityQueue
{
    if (!_highPriorityQueue) {
        _highPriorityQueue = [[NSMutableArray alloc] init];
    }
    
    return _highPriorityQueue;
}


#pragma mark - Public interface implementation

- (void)addDownloadTaskToNormalPriorityQueue:(NSURLSessionTask *)task
{
    [self.normalPriorityQueue addObject:task];
    if ([self isHighPriorityQueueEmpty]) {
        [self startTask:task];
    }
}


- (void)removeDownloadTask:(NSURLSessionTask *)task
{
    [self cancelTask:task];
    [self.highPriorityQueue removeObject:task];
    [self.normalPriorityQueue removeObject:task];
    [self resumeNormalPriorityQueue];
    
}


- (void)addDownloadTaskToHighPriorityQueue:(NSURLSessionTask *)task
{
    // TODO: Check if task with same url exists in the other queue,
    // If yes, then move it to here
    [self.highPriorityQueue addObject:task];
    task.priority = NSURLSessionTaskPriorityHigh;
    [self startTask:task];
    [self suspendNormalPriorityQueue];
}

- (void)removeAllTasksFromHighPriorityQueue
{
    // TODO: Suspend all of the active tasks in the HPQ,
    // decrease the priority of the task
    // Move them to the NPQ
    [self resumeNormalPriorityQueue];
    
}


- (void)cleanQueues {
    
    [self cleanQueue:self.normalPriorityQueue];
    [self cleanQueue:self.highPriorityQueue];
    
}

#pragma mark - Private functions
- (BOOL)isHighPriorityQueueEmpty
{
    [self cleanQueues];
    if (self.highPriorityQueue.count == 0) {
        return true;
    } else {
        return false;
    }
    
}

- (void)suspendNormalPriorityQueue
{
    for (NSURLSessionTask *currentTask in self.normalPriorityQueue) {
        [self suspendTask:currentTask];
    }
}

- (void)resumeNormalPriorityQueue
{
    if ([self isHighPriorityQueueEmpty]) {
        for (NSURLSessionTask *currentTask in self.normalPriorityQueue) {
            [self startTask:currentTask];
        }
    }
    
}

- (void)cancelHighPriorityQueue
{
    for (NSURLSessionTask *currentTask in self.normalPriorityQueue) {
        [self cancelTask:currentTask];
    }

}

-(void)cleanQueue: (NSMutableArray *)queue {
    
    for (NSURLSessionTask *task in queue) {
        if (task.state == NSURLSessionTaskStateCompleted || task.state == NSURLSessionTaskStateCanceling) {
            [self removeDownloadTask:task];
        }
    }
}


- (void)startTask:(NSURLSessionTask *)task
{
    if (self.isDebug) {
        NSLog(@"Task started: %@",task.currentRequest.URL);
    }
    [task resume];
    
}

- (void)suspendTask: (NSURLSessionTask *)task
{
    if (self.isDebug) {
        NSLog(@"Task suspended: %@",task.currentRequest.URL);
    }
    [task suspend];
}

- (void)cancelTask: (NSURLSessionTask *)task
{
    if (self.isDebug) {
        NSLog(@"Task cancelled: %@",task.currentRequest.URL);
    }
    [task cancel];
}


@end
