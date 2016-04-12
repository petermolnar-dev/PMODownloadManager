//
//  PMODownloadTaskFactory.m
//  PMODownloadManager
//
//  Created by Peter Molnar on 12/04/2016.
//  Copyright © 2016 Peter Molnar. All rights reserved.
//

#import "PMODownloadTaskFactory.h"

@implementation PMODownloadTaskFactory

+ (NSURLSessionDataTask *)createNewTaskWithURLString:(NSString *)urlAsString withDelegate:(id)delegate session:(NSURLSession *)session
{
    
    NSURL *url = [NSURL URLWithString:urlAsString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
//    NSURLSessionDataTask *downloadTask = [session dataTaskWithRequest:request completionHandler:
//                                          ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                                              // Completion
//                                              
//                                              NSString *json = [[NSString alloc] initWithData:data
//                                                                                     encoding:NSUTF8StringEncoding];
//                                              
//                                              NSLog(@"%@", json);
//                                              
//                                          }];
    NSURLSessionDataTask *downloadTask = [session dataTaskWithRequest:request];

    return downloadTask;

}

@end
