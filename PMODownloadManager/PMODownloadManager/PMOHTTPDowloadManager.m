//
//  PMOHTTPDowloadManager.m
//  Parallels_test2
//
//  Created by Peter Molnar on 06/04/2016.
//  Copyright © 2016 Peter Molnar. All rights reserved.
//

#import "PMOHTTPDowloadManager.h"

@interface PMOHTTPDowloadManager()
@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) NSOperationQueue *suspendableQueue;
@property (strong, nonatomic) NSMutableArray *runningDataTasks;
@end

@implementation PMOHTTPDowloadManager

-(instancetype)init {
    self = [super init];
    
    if (self) {
        
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        //TODO: Check how and what should be parametarized for the session
        _session = [NSURLSession sessionWithConfiguration:sessionConfiguration
                                                 delegate:nil
                                            delegateQueue:self.suspendableQueue];
        
    }
    return self;
}

-(NSOperationQueue *)suspendableQueue {

    if (!_suspendableQueue) {
        _suspendableQueue = [[NSOperationQueue alloc] init];
    }
    return _suspendableQueue;
}

-(NSMutableArray *)runningDataTasks {

    if (!_runningDataTasks) {
        _runningDataTasks = [[NSMutableArray alloc] init];
    }
    
    return _runningDataTasks;
}

-(void)startNewDataTaskWithURLAsString:(NSString *)urlAsString {
    NSURL *url = [NSURL URLWithString:urlAsString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    NSURLSessionDataTask *downloadTask = [self.session dataTaskWithRequest:request completionHandler:
    ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // Completion
        
        NSString *json = [[NSString alloc] initWithData:data
                                               encoding:NSUTF8StringEncoding];
        
        //NSLog(@"%@", json);
        
    }];
    [self.runningDataTasks addObject:downloadTask];
    NSLog(@"Running tasks \n: %@", [self.suspendableQueue valueForKey:@"operations"]);
    NSLog(@"Running tasks Count \n: %@", [self.suspendableQueue valueForKey:@"operationCount"]);
    // Task is peaused when created, start it.
    [downloadTask resume];

}

@end
