import XCTest
@testable import IDMEF

final class IDMEFDeserializeTests: XCTestCase {
    func test1() throws {
        let msg = message1()
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        if let jsonData = try? encoder.encode(msg) {
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
        }
    }
       
    func test2() throws {
        let decoder = JSONDecoder()
        let jsonData = Data(string1().utf8)
        if let msg = try? decoder.decode(IDMEFObject.self, from: jsonData) {
            print(msg)
            XCTAssert(true)
        } else {
            XCTFail()
        }
    } 
}
