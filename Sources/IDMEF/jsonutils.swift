import Foundation

/**
Deserialize JSON bytes to a Swift Dictionary

- Parameters:
    - jsonString: the JSON bytes

- Returns: a Swift Dictionary with content filled from JSON
*/
public func deserialize(jsonString: String) -> [String:Any] {
    let jsonData = jsonString.data(using: .utf8)!

    let object = try? JSONSerialization.jsonObject(with: jsonData, options: [])

    // Cast to a Swift Dictionary
    return object as! [String:Any]
}
