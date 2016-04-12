//
//  PMOHTTPDowloadManager.m
//  Parallels_test2
//
//  Created by Peter Molnar on 06/04/2016.
//  Copyright © 2016 Peter Molnar. All rights reserved.
//


#import "PMOHTTPDownloadManager.h"


#import <UIKit/UIKit.h>

@interface PMOHTTPDownloadManager()

@property (strong, nonatomic) NSURLSession *session;
// Only for reference
@property (weak, nonatomic) UIActivityIndicatorView *activityView;

@end

@implementation PMOHTTPDownloadManager

-(instancetype)init {
    self = [super init];
    
    if (self) {
        
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        //TODO: Check how and what should be parametarized for the session
        _session = [NSURLSession sessionWithConfiguration:sessionConfiguration
                                                 delegate:nil
                                            delegateQueue:nil];
        
    }
    return self;
}


-(void)startNewDataTaskWithURLAsString:(NSString *)urlAsString {

}

- (void)startNewDataTaskWithURLAsString:(NSString *)urlAsString downloadPriority:(DownloadQueuePriorities)priority
{
    
}

@end
