import Foundation
import JSONSchema

public struct IDMEFObject {
    var content: [String:Any]

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

    public func serialize() -> String? {
        let nsDictionary = NSDictionary(dictionary: content)

        if let jsonData = try? JSONSerialization.data(withJSONObject: nsDictionary, options: [.prettyPrinted]) {
            return String(data: jsonData, encoding: .utf8)
        }

        return nil
    }

    public static func deserialize(json: String) -> IDMEFObject? {
        let content = IDMEF.deserialize(jsonString: json)
        
        return IDMEFObject(content: content)
    }
    
    public func validate(simplified: Bool = true) throws -> Bool {
        let schema = simplified ? simpleSchema() : fullSchema()

        let errors = try JSONSchema.validate(content, schema: schema)

        return errors.valid
    }

}
