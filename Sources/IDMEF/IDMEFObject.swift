import Foundation

struct IDMEFObject {
    var content: [AnyHashable:Any]

    init(content: [AnyHashable:Any]? = nil) {
        if content != nil {
            self.content = content!
        } else {
            self.content = [AnyHashable:Any]()
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


    static func deserialize(jsonString: String) -> IDMEFObject? {
        let jsonData = jsonString.data(using: .utf8)!

        let object = try? JSONSerialization.jsonObject(with: jsonData, options: [])

        // Cast to a Swift Dictionary
        let dict = object as? [AnyHashable:Any]
        
        return IDMEFObject(content: dict)
    }
    
}
