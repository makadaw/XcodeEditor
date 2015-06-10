//
//  SCSchemeBuildAction.m
//  xcode-editor
//
//  Created by Alexandr on 6/9/15.
//
//

#import "XCSchemeBuildAction.h"
#import "IGHTMLQuery.h"
#import "XCSchemeBuildActionEntry.h"

@implementation XCSchemeBuildAction

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.buildActionEntries = @[];
    }
    return self;
}

- (void)updateBuildableReference:(XCSchemeBuildableReference*)reference
{
    for (XCSchemeBuildActionEntry *entry in self.buildActionEntries) {
        if ([entry.attributes[@"buildForArchiving"] isEqualToString:@"YES"]) {
            entry.buildableReference = reference;
        }
    }
}

- (void)parseNode:(IGXMLNode*)node
{
    [super parseNode:node];
    [[node queryWithXPath:@"BuildActionEntries/BuildActionEntry"] enumerateNodesUsingBlock:^(IGXMLNode *entry, NSUInteger idx, BOOL *stop){
        [self parseEntryNode:entry];
    }];
}

- (void)parseEntryNode:(IGXMLNode*)entry
{
    NSMutableArray *entries = [self.buildActionEntries mutableCopy];
    XCSchemeBuildActionEntry *entryInfo = [[XCSchemeBuildActionEntry alloc] init];
    [entryInfo parseNode:entry];
    [entries addObject:entryInfo];
    self.buildActionEntries = [NSArray arrayWithArray:entries];
}

- (IGXMLNode*)asXMLNode
{
    IGXMLNode *node = [super asXMLNode];
    IGXMLDocument *buildActionEntries = [[IGXMLDocument alloc] initWithXMLString:@"<BuildActionEntries/>" error:nil];
    for (XCSchemeBuildActionEntry *entry in self.buildActionEntries) {
        [buildActionEntries addChildWithNode:[entry asXMLNode]];
    }
    [node addChildWithNode:buildActionEntries];
    return node;
}

@end
