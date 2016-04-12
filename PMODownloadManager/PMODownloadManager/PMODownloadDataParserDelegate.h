//
//  PMODownloadDataParserDelegate.h
//  PMODownloadManager
//
//  Created by Peter Molnar on 12/04/2016.
//  Copyright © 2016 Peter Molnar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PMODownloadDataParserDelegate <NSObject>

-(id)parseData:(NSData *) data;

@end
