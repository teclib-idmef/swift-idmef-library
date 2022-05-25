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
 IDMEF schema.
 
 This implementation provides:
 
 - schema loading from file
 - schema loading from resource

 Schema is always returned as a dictionary.
*/
public struct IDMEFSchema {

    static func loadFromFile(filename: String) -> String {
        do {
            let json = try String(contentsOfFile: filename)

            return json
        } catch {
            return ""
        }
    }

    static func simpleFromFile() -> [String:Any] {
        return deserialize(jsonString: loadFromFile(filename: "IDMEFv2.simplified.schema"))
    }

    static func fullFromFile() -> [String:Any] {
        return deserialize(jsonString: loadFromFile(filename: "IDMEFv2.schema"))
    }

    /**
    Load a resource.
    
    - Parameters:
        - resourceName: the name of the resource

    - Returns: a string containing the resource content
    */
    public static func loadFromResource(resourceName: String) -> String {
        let url = Bundle.module.url(forResource: resourceName, withExtension: nil)
        if url != nil {
            do {
                let json = try String(contentsOf: url!)
                return json
            } catch {
            }
        }
       return ""
    }

    /**
    Load a simplified version for testing of the IDMEF JSON schema.

    Schema is obtained by deserializing the corresponding resource.

    - Returns: a dictionary containing the schema 
    */
    public static func simple() -> [String:Any] {
        return deserialize(jsonString: loadFromResource(resourceName: "IDMEFv2.simplified.schema"))
    }

    /**
    Load the complete version of the JSON schema.
    
    Schema is obtained by deserializing the corresponding resource.

    - Returns: a dictionary containing the schema 
    */
    public static func full() -> [String:Any] {
        return deserialize(jsonString: loadFromResource(resourceName: "IDMEFv2.schema"))
    }
}
