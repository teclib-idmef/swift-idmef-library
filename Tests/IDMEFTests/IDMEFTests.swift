import XCTest
@testable import IDMEF

final class IDMEFTests: XCTestCase {
    func test1() throws {
        let msg = IDMEFExample.message1()
        XCTAssert(msg["Version"] != nil)
    }

    func test2() throws {
        let msg = IDMEFExample.message2()
        XCTAssert(msg["ID"] != nil)
    }

    func test3() throws {
        let msg = IDMEFExample.message1()
        XCTAssertEqual(msg["Version"] as! String, "2.0.3")
    }
}