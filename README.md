# Swift IDMEFv2 library

![GitHub top language](https://img.shields.io/github/languages/top/teclib-idmef/swift-idmef-library) 
![GitHub](https://img.shields.io/github/license/teclib-idmef/swift-idmef-library) 
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/teclib-idmef/swift-idmef-library) 
![GitHub release (latest by date)](https://img.shields.io/github/v/release/teclib-idmef/swift-idmef-library) 
![GitHub issues](https://img.shields.io/github/issues/teclib-idmef/swift-idmef-library)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)

A Swift library for parsing, handling, and generating JSON IDMEFv2 messages. It can be used to represent Incident Detection Message Exchange Format (IDMEFv2) messages in memory, validate them and serialize/unserialize them for exchange with other systems.

IDMEFv2 messages can be transported using the [`swift-idmef-transport-library`](https://github.com/teclib-idmef/swift-idmef-transport-library).

This code is currently in an experimental status and is regularly kept in sync with the development status of the IDMEFv2 format, as part of the [SECurity Exchange Format project](https://www.secef.net/).

The latest revision of the IDMEFv2 format specification can be found there: https://github.com/IDMEFv2/IDMEFv2-Specification

You can find more information about the previous version (v1) of the Intrusion Detection Message Exchange Format in [RFC 4765](https://tools.ietf.org/html/rfc4765).

## Compiling the library

The following prerequisites must be installed on your system to install and use this library:

* Swift: version 5.5 or above

The library has the following third-party dependencies:

* JSONSchema for Swift: https://github.com/kylef/JSONSchema.swift.git

**Note**: building using swift automaticaly pulls the needed dependencies.

To compile the library:

``` shell
swift build
``` 

This will build a bundle located in `./.build/`.

## Using the libray

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. 

Once you have your Swift package set up, adding `swift-idmef-library` as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/teclib-idmef/swift-idmef-library.git", .upToNextMajor(from: "1.0.1"))
]
```

### Message creation

A new message can be created by instantiating the `org.idmef.IDMEFObject` class. Once created, message fields can be set using the `put()` method.

``` swift
import Foundation
@testable import IDMEF

@main
public class IDMEFExample {
    public static func message1(fixed: Bool? = true) -> IDMEFObject {
        var msg = IDMEFObject()
        msg["Version"] = "2.0.3"
        msg["ID"] = (fixed! as Bool) ? "09db946e-673e-49af-b4b2-a8cd9da58de6" : UUID().uuidString
        msg["CreateTime"] = "2021-11-22T14:42:51.881033Z"

        var analyzer = [AnyHashable:Any]()
        analyzer["IP"] = "127.0.0.1"
        analyzer["Name"] = "foobar"
        analyzer["Model"] = "generic"
        analyzer["Category"] = ["LOG"]
        analyzer["Data"] = ["Log"]
        analyzer["Method"] = ["Monitor"]

        msg["Analyzer"] = analyzer

        return msg
    }

    static func main() {
        let msg = message1()
        let id = msg["ID"]
        print("message ID is \(id\)")
    }
}
```

### Message validation

You can validate an IDMEFv2 message using `validate()` method of class `IDMEFValidator`. A `IDMEFException` is raised if the message is invalid.

``` swift
```

### Message serialization

Before the message can be sent to a remote system, it must be serialized using the `serialize()` method.

``` swift
```

### Message deserialization

Likewise, when a message is received in its serialized form, it must be first deserialized using the `deserialize()` class method.

``` swift
```

## Contributions

All contributions must be licensed under the Apache-2.0 license. See the LICENSE file inside this repository for more information.

