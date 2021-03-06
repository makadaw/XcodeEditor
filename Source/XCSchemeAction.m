//
//  XCSchemeAction.m
//  xcode-editor
//
//  Created by Alexandr on 6/9/15.
//
//

#import "XCSchemeAction.h"
#import "IGHTMLQuery.h"

@implementation XCSchemeAction

- (void)parseNode:(IGXMLNode*)node
{
    self.name = [node.tag stringByReplacingOccurrencesOfString:@"Action" withString:@""];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    for (NSString *key in [node attributeNames]) {
        attributes[key] = [node attribute:key];
    }
    self.attributes = [NSDictionary dictionaryWithDictionary:attributes];
}

- (IGXMLNode*)asXMLNode
{
    IGXMLDocument *node = [[IGXMLDocument alloc] initWithXMLString:@"<Tag/>" error:nil];
    node.tag = [NSString stringWithFormat:@"%@Action", self.name];
    for (NSString *key in [self.attributes allKeys]) {
        [node setAttribute:key value:self.attributes[key]];
    }
    return node;
}

@end
