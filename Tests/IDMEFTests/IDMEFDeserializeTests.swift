import XCTest
@testable import IDMEF

func deserializeAndCheck(data: String, expected: IDMEFObject) -> IDMEFObject{
    let decoder = JSONDecoder()
    let jsonData = Data(data.utf8)
    if let msg = try? decoder.decode(IDMEFObject.self, from: jsonData) {
        XCTAssertEqual(msg.ID, expected.ID)
        XCTAssertEqual(msg.CreateTime, expected.CreateTime)
        XCTAssertEqual(msg.Version, expected.Version)
        return msg
    } else {
        XCTFail()
    }

    return IDMEFObject()
}

final class IDMEFDeserializeTests: XCTestCase {
    func test1() throws {
        _ = deserializeAndCheck(data: string1(), expected: message1())
    }

    func test2() throws {
        let expected = message2()
        let msg = deserializeAndCheck(data: string2(), expected: expected)
        XCTAssertEqual(msg.Sensor?[0].IP, expected.Sensor?[0].IP)
    }
}
