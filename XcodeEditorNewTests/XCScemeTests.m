//
//  XCScemeTests.m
//  xcode-editor
//
//  Created by Alexandr on 6/9/15.
//
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "XCSchemeDefinition.h"

static NSString *xmlF = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?><Scheme LastUpgradeVersion = \"0500\" version = \"1.3\"><BuildAction parallelizeBuildables = \"YES\" buildImplicitDependencies = \"YES\"><BuildActionEntries><BuildActionEntry buildForTesting = \"YES\" buildForRunning = \"YES\" buildForProfiling = \"YES\" buildForArchiving = \"YES\" buildForAnalyzing = \"YES\"><BuildableReference BuildableIdentifier = \"primary\" BlueprintIdentifier = \"7B80F18918187FA5005578A0\" BuildableName = \"TestProj.app\" BlueprintName = \"TestProj\" ReferencedContainer = \"container:TestProj.xcodeproj\"> </BuildableReference></BuildActionEntry></BuildActionEntries></BuildAction><TestAction selectedDebuggerIdentifier = \"Xcode.DebuggerFoundation.Debugger.LLDB\" selectedLauncherIdentifier = \"Xcode.DebuggerFoundation.Launcher.LLDB\" shouldUseLaunchSchemeArgsEnv = \"YES\" buildConfiguration = \"Coverage\"><Testables><TestableReference skipped = \"NO\"><BuildableReference BuildableIdentifier = \"primary\" BlueprintIdentifier = \"7B80F1A418187FA5005578A0\" BuildableName = \"TestProjTests.xctest\" BlueprintName = \"TestProjTests\" ReferencedContainer = \"container:TestProj.xcodeproj\"></BuildableReference></TestableReference></Testables><PostActions><ExecutionAction ActionType =      \"Xcode.IDEStandardExecutionActionsCore.ExecutionActionType.ShellScriptAction\"><ActionContent title = \"Run Script\" scriptText = \"/bin/sh ${SRCROOT}/bin/coverage.sh\"><EnvironmentBuildable><BuildableReference BuildableIdentifier = \"primary\" BlueprintIdentifier = \"7B80F18918187FA5005578A0\" BuildableName = \"TestProj.app\" BlueprintName = \"TestProj\" ReferencedContainer = \"container:TestProj.xcodeproj\"></BuildableReference></EnvironmentBuildable></ActionContent></ExecutionAction></PostActions></TestAction><LaunchAction selectedDebuggerIdentifier = \"Xcode.DebuggerFoundation.Debugger.LLDB\" selectedLauncherIdentifier = \"Xcode.DebuggerFoundation.Launcher.LLDB\" launchStyle = \"0\" useCustomWorkingDirectory = \"NO\" buildConfiguration = \"Debug\" ignoresPersistentStateOnLaunch = \"NO\" debugDocumentVersioning = \"YES\" allowLocationSimulation = \"YES\"><AdditionalOptions></AdditionalOptions></LaunchAction><ProfileAction shouldUseLaunchSchemeArgsEnv = \"YES\" savedToolIdentifier = \"\" useCustomWorkingDirectory = \"NO\" buildConfiguration = \"Release\" debugDocumentVersioning = \"YES\"></ProfileAction><AnalyzeAction buildConfiguration = \"Debug\"></AnalyzeAction><ArchiveAction buildConfiguration = \"Release\" revealArchiveInOrganizer = \"YES\"></ArchiveAction></Scheme>";

@interface XCScemeTests : XCTestCase
@property (strong, nonatomic) NSString *schemeXML;

@end

@implementation XCScemeTests

- (void)setUp {
    [super setUp];
    self.schemeXML = xmlF;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSchemeParsing
{
    XCSchemeDefinition *scheme = [[XCSchemeDefinition alloc] init];
    [scheme parseXML:self.schemeXML];
    XCTAssert([scheme.version isEqualToString:@"1.3"], @"Scheme do not parse version");
    XCTAssertGreaterThan([scheme.actions count], 0, @"Loaded scheme actions");
}

- (void)testSchemeSerialize
{
    XCSchemeDefinition *scheme = [[XCSchemeDefinition alloc] init];
    [scheme parseXML:self.schemeXML];
    NSString *xml = [scheme asXML];
    XCTAssertNotNil(xml, @"Scheme serialize is nil");
}


@end
