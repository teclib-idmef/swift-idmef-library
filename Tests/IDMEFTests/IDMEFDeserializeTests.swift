import XCTest
@testable import IDMEF

func deserializeAndCheck(data: String, expected: IDMEFObject) -> IDMEFObject? {
    if let msg = IDMEFObject.deserialize(jsonString: data) {
        XCTAssertEqual(msg.ID, expected.ID)
        XCTAssertEqual(msg.CreateTime, expected.CreateTime)
        XCTAssertEqual(msg.Version, expected.Version)

        return msg
    } else {
        XCTFail()
    }

    return nil
}

final class IDMEFDeserializeTests: XCTestCase {
    func test1() throws {
        _ = deserializeAndCheck(data: string1(), expected: message1())
    }

    func test2() throws {
        let expected = message2()
        if let msg = deserializeAndCheck(data: string2(), expected: expected) {
            XCTAssertEqual(msg.Sensor?[0].IP, expected.Sensor?[0].IP)
        } else {
            XCTFail()
        }
    }
}
