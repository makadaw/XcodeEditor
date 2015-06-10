//
//  XCSchemeBuildableReference.h
//  xcode-editor
//
//  Created by Alexandr on 6/9/15.
//
//

#import <Foundation/Foundation.h>
#import "XCSchemeXMLNode.h"

@interface XCSchemeBuildableReference : NSObject <XCSchemeXMLNode>
@property (strong, nonatomic) NSDictionary *attributes;

@end
