import XCTest
@testable import Licenses

private let testYAML = """
components:
  mit:
    - licenses, © 2020 Ian Gregory
  gplv3:
    - bushelscript, © 2019–2020 Ian Gregory
licenses:
  mit:
    name: MIT License
  gplv3:
    name: GPL v3
"""

final class ConfigurationTests: XCTestCase {
    
    func test_configurationParsing_roundTrips() throws {
        let configuration = try Configuration(yaml: testYAML)
        
        let newYAML = try configuration.yaml()
        let newConfiguration = try Configuration(yaml: newYAML)
        
        XCTAssertEqual(configuration, newConfiguration)
    }
    
    static var allTests = [
        ("test_configurationParsing_roundTrips", test_configurationParsing_roundTrips),
    ]
    
}
