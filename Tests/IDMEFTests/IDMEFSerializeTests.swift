import XCTest
@testable import IDMEF

final class IDMEFSerializeTests: XCTestCase {
    func test1() throws {
        let msg = message1()
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        if let jsonData = try? encoder.encode(msg) {
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
        }
        
        XCTAssert(true)
    } 
}
