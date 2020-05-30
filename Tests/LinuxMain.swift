import XCTest

import licensesTests

var tests = [XCTestCaseEntry]()
tests += ConfigurationTests.allTests()
tests += CompileTests.allTests()
XCTMain(tests)
