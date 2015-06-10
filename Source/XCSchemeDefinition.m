//
//  XCSchemeDefinition.m
//  Pods
//
//  Created by Alexandr on 6/9/15.
//
//

#import "XCSchemeDefinition.h"
#import "IGHTMLQuery.h"
#import "XCSchemeBuildAction.h"
#import "XCSchemeTestAction.h"

@implementation XCSchemeDefinition

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.actions = @[];
    }
    return self;
}

#pragma mark - Actions

- (void)addAction:(XCSchemeAction*)action
{
    NSMutableArray *actions = [self.actions mutableCopy];
    [actions addObject:action];
    self.actions = [NSArray arrayWithArray:actions];
}

- (void)removeAction:(XCSchemeAction*)action
{
    NSMutableArray *actions = [self.actions mutableCopy];
    [actions removeObject:action];
    self.actions = [NSArray arrayWithArray:actions];
}


#pragma mark - Parse/Serialize

- (void)parseXML:(NSString*)xml
{
    IGXMLDocument *rootNode = [[IGXMLDocument alloc] initWithXMLString:xml error:nil];
    self.version = [rootNode attribute:@"version"];
    self.lastUpgradeVersion = [rootNode attribute:@"LastUpgradeVersion"];
    
    [[rootNode children] enumerateNodesUsingBlock:^(IGXMLNode *node, NSUInteger idx, BOOL *stop){
        XCSchemeAction *action = [self actionFromNode:node];
        if (action) {
            [self addAction:action];
        }
    }];
}

// TODO add here fabric
- (XCSchemeAction*)actionFromNode:(IGXMLNode *)node
{
    Class nodeCls;
    if ([node.tag isEqualToString:@"BuildAction"]) {
        nodeCls = [XCSchemeBuildAction class];
    } else if ([node.tag isEqualToString:@"TestAction"]) {
        nodeCls = [XCSchemeTestAction class];
    } else {
        nodeCls = [XCSchemeAction class];
    }
    
    XCSchemeAction *action = [[nodeCls alloc] init];
    [action parseNode:node];
    return action;
}

- (NSString*)asXML
{
    NSError *err;
    IGXMLDocument *rootNode = [[IGXMLDocument alloc] initWithXMLString:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?><Scheme/>" error:&err];
    [rootNode setAttribute:@"LastUpgradeVersion" value:self.lastUpgradeVersion];
    [rootNode setAttribute:@"version" value:self.version];
    for (XCSchemeAction *action in self.actions) {
        [rootNode addChildWithNode:[action asXMLNode]];
    }
    return [rootNode xml];
}

@end
