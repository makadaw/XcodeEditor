//
//  XCSchemeAction.h
//  xcode-editor
//
//  Created by Alexandr on 6/9/15.
//
//

#import <Foundation/Foundation.h>
#import "XCSchemeXMLNode.h"

@interface XCSchemeAction : NSObject <XCSchemeXMLNode>
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDictionary *attributes;

@end
