//
//  PMODownloadTaskQueueManagerTests.m
//  PMODownloadManager
//
//  Created by Peter Molnar on 10/04/2016.
//  Copyright © 2016 Peter Molnar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PMODownloadTaskQueueManager.h"
@interface PMODownloadTaskQueueManagerTests : XCTestCase

@property (strong, nonatomic) PMODownloadTaskQueueManager *queueManager;
@property (strong, nonatomic) NSURLSession *session;

@end

@implementation PMODownloadTaskQueueManagerTests

- (void)setUp {
    [super setUp];
    self.queueManager = [[PMODownloadTaskQueueManager alloc] init];
    [self.queueManager setIsDebug:true];
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //TODO: Check how and what should be parametarized for the session
    _session = [NSURLSession sessionWithConfiguration:sessionConfiguration
                                             delegate:nil
                                        delegateQueue:nil];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testNormalQueue {
    
    
    
    NSURL *url = [NSURL URLWithString:@"http://93.175.29.76/web/wwdc/wwdc5.png"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *downloadTask = [self.session dataTaskWithRequest:request completionHandler:
                                          ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                              // Completion
                                              
                                              NSLog(@"%@ Download is done",url);
                                              
                                        }];
    [self.queueManager addDownloadTaskToNormalPriorityQueue:downloadTask];


}

@end
