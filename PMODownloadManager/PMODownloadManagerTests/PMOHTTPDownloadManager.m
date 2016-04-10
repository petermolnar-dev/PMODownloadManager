//
//  PMOHTTPDownloadManager.m
//  PMODownloadManager
//
//  Created by Peter Molnar on 10/04/2016.
//  Copyright © 2016 Peter Molnar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PMOHTTPDowloadManager.h"

@interface PMOHTTPDownloadManager : XCTestCase

@end

@implementation PMOHTTPDownloadManager



- (void)testForHTTPManager {
    PMOHTTPDowloadManager *dlManager = [[PMOHTTPDowloadManager alloc] init];
    
    XCTAssertNotNil(dlManager);
}

-(void)testForDownloadData {
    PMOHTTPDowloadManager *dlManager = [[PMOHTTPDowloadManager alloc] init];
    
    [dlManager startNewDataTaskWithURLAsString:@"http://93.175.29.76/web/wwdc/items.json"];
    
    XCTAssertTrue(true);
}

-(void)testForMultipleDownload {
    
}


@end
