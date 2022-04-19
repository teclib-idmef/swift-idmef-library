import Foundation
import JSONSchema

/**
 
 IDMEF base object.
 
 This implementation provides:
 
 - property getting
 - property setting: no check is done on property key, check is done by IDMEFValidator
 - serialization of a IDMEFObject instance to JSON bytes
 - deserialization if JSON bytes to a IDMEFObject instance
 - validation of an IDMEFObject against JSON schema
 
*/
public struct IDMEFObject {
    var content: [String:Any]

    /**
    Initializes a IDMEFObject.

    - Parameters:
        - content: the optional content of the created IDMEFObject
    */
    public init(content: [String:Any]? = nil) {
        if content != nil {
            self.content = content!
        } else {
            self.content = [String:Any]()
        }
    }

    public subscript(key: String) -> Any? {
        get {
            return content[key]
        }
        set(newValue) {
            content[key] = newValue
        }
    }

    /**
    Serialize a Message to JSON bytes.
    
    - Returns: the JSON bytes as a String
    */
    public func serialize() -> String? {
        let nsDictionary = NSDictionary(dictionary: content)

        if let jsonData = try? JSONSerialization.data(withJSONObject: nsDictionary, options: [.prettyPrinted]) {
            return String(data: jsonData, encoding: .utf8)
        }

        return nil
    }

    /**
    Deserialize JSON bytes to a IDMEFObject
    
    - Parameters:
        - json: the JSON bytes
    
    - Returns: a IDMEFObject object with content filled from JSON
    */
    public static func deserialize(json: String) -> IDMEFObject? {
        let content = IDMEF.deserialize(jsonString: json)
        
        return IDMEFObject(content: content)
    }
    
    /**
    Validate the content of a IDMEFObject
    
    - Parameters:
        - simplified: if true, will use a simplified schema for testing

    - Throws: an exception if an error occured during schema building

    - Returns: true if the IDMEFObject content is valid against the specified JSON schema, false if not
    */
    public func validate(simplified: Bool = true) throws -> Bool {
        let schema = simplified ? IDMEFSchema.simple() : IDMEFSchema.full()

        let errors = try JSONSchema.validate(content, schema: schema)

        return errors.valid
    }

}
