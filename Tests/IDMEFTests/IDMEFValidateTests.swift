import XCTest
@testable import IDMEF

func validate(msg: IDMEFObject, simplified: Bool) throws {
    if try !msg.validate(simplified: simplified) {
        XCTFail()
    }
}

final class IDMEFValidateTests: XCTestCase {
    func test1() throws {
        try validate(msg: IDMEFExample.message1(), simplified: true)
    } 

    func test2() throws {
        try validate(msg: IDMEFExample.message1(), simplified: false)
    } 

    func test3() throws {
        try validate(msg: IDMEFExample.message2(), simplified: false)
    } 

}
