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
