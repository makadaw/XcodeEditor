//
//  SCSchemeBuildAction.h
//  xcode-editor
//
//  Created by Alexandr on 6/9/15.
//
//

#import "XCSchemeAction.h"

@interface XCSchemeBuildAction : XCSchemeAction <XCSchemeActionContentBuildReference>
@property (strong, nonatomic) NSArray *buildActionEntries;

@end
