//
//  XCSchemeDefinition.h
//  Pods
//
//  Created by Alexandr on 6/9/15.
//
//

#import <Foundation/Foundation.h>
#import "XCSchemeAction.h"

/**
 * Represent scheme in xcode project
 */
@interface XCSchemeDefinition : NSObject
@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) NSString *lastUpgradeVersion;
@property (strong, nonatomic) NSString *version;
@property (strong, nonatomic) NSArray *actions;

- (void)addAction:(XCSchemeAction*)action;
- (void)removeAction:(XCSchemeAction*)action;

- (void)parseXML:(NSString*)xml;
- (NSString*)asXML;

@end
