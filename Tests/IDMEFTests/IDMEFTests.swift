import XCTest
@testable import IDMEF

final class IDMEFTests: XCTestCase {
    func test1() throws {
        var io = IDMEFObject()
        io["foo"] = "bar"
        XCTAssert(io["foo"] is String)
    }
}
