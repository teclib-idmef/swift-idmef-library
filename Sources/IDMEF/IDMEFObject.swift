
//typealias IDMEFObject = Dictionary<String, Codable>

struct IDMEFObject : Codable {
    var Version: String?
    var ID: String?
    var CreateTime: String?
    var Analyzer: Analyzer?
}

struct Analyzer : Codable {
    var IP: String?
    var Name: String?
    var Model: String?
    var Category: [String]?
    var Data: [String]?
    var Method: [String]?
}

