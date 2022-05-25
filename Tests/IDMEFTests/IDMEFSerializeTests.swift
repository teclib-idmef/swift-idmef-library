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
func serialize(msg: IDMEFObject, outFile: String) {
    if let jsonString = msg.serialize() {
        do {
            try jsonString.write(to: URL(fileURLWithPath: outFile), atomically: true, encoding: String.Encoding.utf8)
        } catch {
            XCTFail()
        }
    }
    
    XCTAssert(true)
}

final class IDMEFSerializeTests: XCTestCase {
    func test1() throws {
        serialize(msg: IDMEFExample.message1(), outFile: "out1.json")
    } 

    func test2() throws {
        serialize(msg: IDMEFExample.message2(), outFile: "out2.json")
    }

    func test3() throws {
        serialize(msg: IDMEFExample.message1(fixed: false), outFile: "out1v.json")
    } 

    func test4() throws {
        serialize(msg: IDMEFExample.message2(fixed: false), outFile: "out2v.json")
    }
}
