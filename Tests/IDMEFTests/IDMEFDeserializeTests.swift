/*
 * Copyright (C) 2022 Teclib'
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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
        _ = deserializeAndCheck(data: IDMEFExample.string1(), expected: IDMEFExample.message1())
    }

    func test2() throws {
        let expected = IDMEFExample.message2()
        guard let msg = deserializeAndCheck(data: IDMEFExample.string2(), expected: expected) else {
            return
        }

        let sensors = msg["Sensor"] as! [[String:Any]]
        let expectedSensors = expected["Sensor"] as! [[String:Any]]
                    
        XCTAssertEqual(sensors[0]["IP"] as! String, expectedSensors[0]["IP"] as! String)
    }
}
