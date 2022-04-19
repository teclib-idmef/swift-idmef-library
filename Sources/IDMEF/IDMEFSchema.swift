import Foundation

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

    static func loadFromResource(resourceName: String) -> String {
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

    static func simple() -> [String:Any] {
        return deserialize(jsonString: loadFromResource(resourceName: "IDMEFv2.simplified.schema"))
    }

    static func full() -> [String:Any] {
        return deserialize(jsonString: loadFromResource(resourceName: "IDMEFv2.schema"))
    }
}
