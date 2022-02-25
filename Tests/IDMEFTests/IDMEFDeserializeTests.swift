import XCTest
@testable import IDMEF

func deserializeAndCheck(data: String, expected: IDMEFObject) -> IDMEFObject? {
    if let msg = IDMEFObject.deserialize(json: data) {
        print(msg)
        XCTAssert(msg["ID"] is String)
        XCTAssertEqual(msg["CreateTime"] as! String, expected["CreateTime"] as! String)
        XCTAssertEqual(msg["CreateTime"] as! String, expected["CreateTime"] as! String)
        XCTAssertEqual(msg["Version"] as! String, expected["Version"] as! String)

        return msg
    }

    return nil
}

final class IDMEFDeserializeTests: XCTestCase {
    func test1() throws {
        _ = deserializeAndCheck(data: string1(), expected: message1())
    }

    func test2() throws {
        let expected = message2()
        guard let msg = deserializeAndCheck(data: string2(), expected: expected) else {
            return
        }

        let sensors = msg["Sensor"] as! [[String:Any]]
        let expectedSensors = expected["Sensor"] as! [[String:Any]]
                    
        XCTAssertEqual(sensors[0]["IP"] as! String, expectedSensors[0]["IP"] as! String)
    }
}
