import Foundation

func deserialize(jsonString: String) -> [String:Any] {
    let jsonData = jsonString.data(using: .utf8)!

    let object = try? JSONSerialization.jsonObject(with: jsonData, options: [])

    // Cast to a Swift Dictionary
    return object as! [String:Any]
}

func loadSchema(filename: String) -> [String:Any] {
    do {
        let json = try String(contentsOfFile: filename)

        return deserialize(jsonString: json)
    } catch {
        return [:]
    }
}

func simpleSchema() -> [String:Any] {
    return loadSchema(filename: "IDMEFv2.simplified.schema")
}
