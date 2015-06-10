//
//  XCSchemeTestAction.m
//  xcode-editor
//
//  Created by Alexandr on 6/10/15.
//
//

#import "XCSchemeTestAction.h"
#import "IGHTMLQuery.h"

// TODO now testing action store all as XML string
@interface XCSchemeTestAction ()
@property (strong, nonatomic) NSArray *childs;

@end

@implementation XCSchemeTestAction

- (void)parseNode:(IGXMLNode*)node
{
    [super parseNode:node];
    NSMutableArray *array = [NSMutableArray array];
    [node.children enumerateNodesUsingBlock:^(IGXMLNode *child, NSUInteger idx, BOOL *stop){
        [array addObject:[child xml]];
    }];
    self.childs = array;
}

- (IGXMLNode*)asXMLNode
{
    IGXMLNode *node = [super asXMLNode];
    [self.childs enumerateObjectsUsingBlock:^(NSString *child, NSUInteger idx, BOOL *stop){
        [node addChildWithXMLString:child];
    }];
    return node;
}


@end
