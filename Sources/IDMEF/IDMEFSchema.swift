
struct IDMEFSchema {

    static func loadSchema(filename: String) -> String {
        do {
            let json = try String(contentsOfFile: filename)

            return json
        } catch {
            return ""
        }
    }

    static func simpleFromFile() -> [String:Any] {
        return deserialize(jsonString: loadSchema(filename: "IDMEFv2.simplified.schema"))
    }

    static func fullFromFile() -> [String:Any] {
        return deserialize(jsonString: loadSchema(filename: "IDMEFv2.schema"))
    }

    static func simple() -> [String:Any] {
        return simpleFromFile()
    }

    static func full() -> [String:Any] {
        return fullFromFile()
    }

    // static func simple() -> [String:Any] {
    //     if IDMEFSimplifiedSchemaString != loadSchema(filename: "IDMEFv2.simplified.schema") {
    //         print("WTF!!!")
    //         return [:]
    //     }
    //     return deserialize(jsonString: IDMEFSimplifiedSchemaString)
    // }

    // static func full() -> [String:Any] {
    //     return deserialize(jsonString: IDMEFFullSchemaString)
    // }

}
