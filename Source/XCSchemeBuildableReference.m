//
//  XCSchemeBuildableReference.m
//  xcode-editor
//
//  Created by Alexandr on 6/9/15.
//
//

#import "XCSchemeBuildableReference.h"
#import "IGHTMLQuery.h"

@implementation XCSchemeBuildableReference

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
}

- (IGXMLNode*)asXMLNode
{
    IGXMLDocument *node = [[IGXMLDocument alloc] initWithXMLString:@"<BuildableReference/>" error:nil];
    for (NSString *key in [self.attributes allKeys]) {
        [node setAttribute:key value:self.attributes[key]];
    }
    return node;
}

@end
