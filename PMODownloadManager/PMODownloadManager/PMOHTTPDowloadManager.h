//
//  PMOHTTPDowloadManager.h
//  Parallels_test2
//
//  Created by Peter Molnar on 06/04/2016.
//  Copyright © 2016 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMOHTTPDowloadManager : NSObject

-(void)startNewDataTaskWithURLAsString:(NSString *)urlAsString;

@end
