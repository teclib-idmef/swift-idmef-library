import Foundation

struct IDMEFObject : Codable {
    var Version: String?
    var ID: String?
    var CreateTime: String?
    var Analyzer: Analyzer?
    var Sensor: [Sensor]?

    func serialize() -> String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        if let jsonData = try? encoder.encode(self) {
            return String(data: jsonData, encoding: .utf8)
        }

        return nil
    }

    static func deserialize(jsonString: String) -> IDMEFObject? {
        let decoder = JSONDecoder()
        let jsonData = Data(jsonString.utf8)
        if let msg = try? decoder.decode(IDMEFObject.self, from: jsonData) {
            return msg
        }

        return nil
    }

    
}

struct Analyzer : Codable {
    var IP: String?
    var Name: String?
    var Model: String?
    var Category: [String]?
    var Data: [String]?
    var Method: [String]?
}

struct Sensor : Codable {
    var IP: String?
    var Name: String?
    var Model: String?
}