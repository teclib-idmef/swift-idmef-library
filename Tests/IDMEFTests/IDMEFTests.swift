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

final class IDMEFTests: XCTestCase {
    func test1() throws {
        let msg = IDMEFExample.message1()
        XCTAssert(msg["Version"] != nil)
    }

    func test2() throws {
        let msg = IDMEFExample.message2()
        XCTAssert(msg["ID"] != nil)
    }

    func test3() throws {
        let msg = IDMEFExample.message1()
        XCTAssertEqual(msg["Version"] as! String, "2.0.3")
    }
}