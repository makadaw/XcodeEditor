//
//  XCSchemeBuildActionEntry.h
//  xcode-editor
//
//  Created by Alexandr on 6/9/15.
//
//

#import <Foundation/Foundation.h>
#import "XCSchemeBuildableReference.h"
#import "XCSchemeXMLNode.h"

@interface XCSchemeBuildActionEntry : NSObject <XCSchemeXMLNode>
@property (strong, nonatomic) NSDictionary *attributes;
@property (strong, nonatomic) XCSchemeBuildableReference *buildableReference;

@end
