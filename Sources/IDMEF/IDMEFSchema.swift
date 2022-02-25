
func simpleSchema() -> [String:Any] {
    return loadSchema(filename: "IDMEFv2.simplified.schema")
}

func loadSchema(filename: String) -> [String:Any] {
    do {
        let json = try String(contentsOfFile: filename)

        return deserialize(jsonString: json)
    } catch {
        return [:]
    }
}
