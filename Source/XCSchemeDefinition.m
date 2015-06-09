//
//  XCSchemeDefinition.m
//  Pods
//
//  Created by Alexandr on 6/9/15.
//
//

#import "XCSchemeDefinition.h"

@implementation XCSchemeDefinition

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
    
}

- (NSString*)asXML
{
    return @"";
}

@end
