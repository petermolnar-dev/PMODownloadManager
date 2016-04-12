//
//  PMODownloadTaskFactory.h
//  PMODownloadManager
//
//  Created by Peter Molnar on 12/04/2016.
//  Copyright © 2016 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMODownloadTaskFactory : NSObject

+ (NSURLSessionDataTask *)createNewTaskWithURLString:(NSString *)urlAsString withDelegate:(id)delegate session:(NSURLSession *)session

@end
