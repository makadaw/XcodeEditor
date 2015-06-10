//
//  XCSchemeBuildActionEntry.m
//  xcode-editor
//
//  Created by Alexandr on 6/9/15.
//
//

#import "XCSchemeBuildActionEntry.h"
#import "IGHTMLQuery.h"

@implementation XCSchemeBuildActionEntry

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.attributes = @{};
    }
    return self;
}

- (void)parseNode:(IGXMLNode*)node
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    for (NSString *key in [node attributeNames]) {
        attributes[key] = [node attribute:key];
    }
    self.attributes = [NSDictionary dictionaryWithDictionary:attributes];
    
    XCSchemeBuildableReference *buildableReference = [[XCSchemeBuildableReference alloc] init];
    [buildableReference parseNode:[[node queryWithXPath:@"BuildableReference"] firstObject]];
    self.buildableReference = buildableReference;
}

- (IGXMLNode*)asXMLNode
{
    IGXMLDocument *node = [[IGXMLDocument alloc] initWithXMLString:@"<BuildActionEntry/>" error:nil];
    for (NSString *key in [self.attributes allKeys]) {
        [node setAttribute:key value:self.attributes[key]];
    }
    [node addChildWithNode:[self.buildableReference asXMLNode]];
    return node;
}

@end
