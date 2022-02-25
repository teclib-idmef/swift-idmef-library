import Foundation
import JSONSchema

struct IDMEFObject {
    var content: [String:Any]

    init(content: [String:Any]? = nil) {
        if content != nil {
            self.content = content!
        } else {
            self.content = [String:Any]()
        }
    }

    subscript(key: String) -> Any? {
        get {
            return content[key]
        }
        set(newValue) {
            content[key] = newValue
        }
    }

    func serialize() -> String? {
        let nsDictionary = NSDictionary(dictionary: content)

        if let jsonData = try? JSONSerialization.data(withJSONObject: nsDictionary, options: [.prettyPrinted]) {
            return String(data: jsonData, encoding: .utf8)
        }

        return nil
    }

    static func deserialize(json: String) -> IDMEFObject? {
        let content = IDMEF.deserialize(jsonString: json)
        
        return IDMEFObject(content: content)
    }
    
    func validate() throws -> Bool {
        let errors = try JSONSchema.validate(content, schema: simpleSchema())

        return errors.valid
    }

}
