import XCTest
@testable import IDMEF

func validate(msg: IDMEFObject) throws {
    if try !msg.validate() {
        XCTFail()
    }
}

final class IDMEFValidateTests: XCTestCase {
    func test1() throws {
        try validate(msg: message1())
    } 

}
