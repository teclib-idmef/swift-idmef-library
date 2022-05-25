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

import Foundation

/**
Deserialize JSON bytes to a Swift Dictionary

- Parameters:
    - jsonString: the JSON bytes

- Returns: a Swift Dictionary with content filled from JSON
*/
public func deserialize(jsonString: String) -> [String:Any] {
    let jsonData = jsonString.data(using: .utf8)!

    let object = try? JSONSerialization.jsonObject(with: jsonData, options: [])

    // Cast to a Swift Dictionary
    return object as! [String:Any]
}
