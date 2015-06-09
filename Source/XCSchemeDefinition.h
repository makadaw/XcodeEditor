//
//  XCSchemeDefinition.h
//  Pods
//
//  Created by Alexandr on 6/9/15.
//
//

#import <Foundation/Foundation.h>

/**
 * Represent scheme in xcode project
 */
@interface XCSchemeDefinition : NSObject
@property (strong, nonatomic) NSString *lastUpgradeVersion;
@property (strong, nonatomic) NSString *version;

@end
