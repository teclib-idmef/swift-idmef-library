import Foundation

func deserialize(jsonString: String) -> [String:Any] {
    let jsonData = jsonString.data(using: .utf8)!

    let object = try? JSONSerialization.jsonObject(with: jsonData, options: [])

    // Cast to a Swift Dictionary
    return object as! [String:Any]
}
