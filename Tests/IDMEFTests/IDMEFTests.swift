import XCTest
@testable import IDMEF

final class IDMEFTests: XCTestCase {
    func test1() throws {
        let msg = message1()
        XCTAssert(msg["Version"] is String)
    }

    func test2() throws {
        let msg = message2()
        XCTAssert(msg["ID"] is String)
    }
}
