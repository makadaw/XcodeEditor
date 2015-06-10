//
//  XCSchemeXMLNode.h
//  xcode-editor
//
//  Created by Alexandr on 6/9/15.
//
//

#import <Foundation/Foundation.h>

@class IGXMLNode;

@protocol XCSchemeXMLNode <NSObject>

- (void)parseNode:(IGXMLNode*)node;
- (IGXMLNode*)asXMLNode;

@end
