//
//  ViewController.m
//  PMODownloadManager
//
//  Created by Peter Molnar on 10/04/2016.
//  Copyright © 2016 Peter Molnar. All rights reserved.
//

#import "ViewController.h"
#import "PMODownloadTaskQueueManager.h"
@interface ViewController ()
@property (strong, nonatomic) PMODownloadTaskQueueManager *queueManager;
@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) IBOutlet UIButton *DLButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.queueManager = [[PMODownloadTaskQueueManager alloc] init];
    [self.queueManager setIsDebug:true];
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //TODO: Check how and what should be parametarized for the session
    _session = [NSURLSession sessionWithConfiguration:sessionConfiguration
                                             delegate:nil
                                        delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:@"http://93.175.29.76/web/wwdc/wwdc5.png"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *downloadTask = [self.session dataTaskWithRequest:request completionHandler:
                                          ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                              // Completion
                                              
                                              NSLog(@"%@ Download is done",url);
                                              
                                          }];
    [self.queueManager addDownloadTaskToNormalPriorityQueue:downloadTask];
    
    NSURL *url2 = [NSURL URLWithString:@"http://93.175.29.76/web/wwdc/wwdc6.png"];
    NSURLRequest *request2 = [NSURLRequest requestWithURL:url2];
    
    NSURLSessionDataTask *downloadTask2 = [self.session dataTaskWithRequest:request2 completionHandler:
                                          ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                              // Completion
                                              
                                              NSLog(@"%@ Download is done",url2);
                                              
                                          }];
    [self.queueManager addDownloadTaskToNormalPriorityQueue:downloadTask2];
    
    NSURL *url3 = [NSURL URLWithString:@"http://93.175.29.76/web/wwdc/wwdc7.png"];
    NSURLRequest *request3 = [NSURLRequest requestWithURL:url3];
    
    NSURLSessionDataTask *downloadTask3 = [self.session dataTaskWithRequest:request3 completionHandler:
                                           ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                               // Completion
                                               
                                               NSLog(@"%@ Download is done",url3);
                                               
                                           }];
    [self.queueManager addDownloadTaskToHighPriorityQueue:downloadTask3];



}
- (IBAction)dlButtonTapped:(id)sender {
//    [self.queueManager suspendNormalPriorityQueue];
}

- (IBAction)resumeButtonTapped:(id)sender {
//    [self.queueManager resumeNormalPriorityQueue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
