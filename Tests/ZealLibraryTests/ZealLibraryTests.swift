import XCTest
@testable import ZealLibrary

final class ZealLibraryTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ZealLibrary().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
