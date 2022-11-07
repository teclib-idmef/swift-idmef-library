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

Once you have your Swift package set up, adding Alamofire as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1"))
]
```
