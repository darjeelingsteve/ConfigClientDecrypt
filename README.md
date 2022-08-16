![](Images/Banner.png)

# [![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/Carthage/Carthage/master/LICENSE.md) [![xcode-version](https://img.shields.io/badge/xcode-13-brightgreen)](https://developer.apple.com/xcode/) [![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://swift.org/) [![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

ConfigClientDecrypt provides decryption of properties encrypted by a dhardiman/Config configuration. Once you have linked the framework, add an `encryptionKey` property to your configuration as follows:

```json
"encryptionKey": {
  "type": "EncryptionKey",
  "defaultValue": "<your-encryption-key>"
}
```

Then, add an extension to your generated configuration enum:

```swift
extension MyGeneratedConfiguration: EncryptionKeyProviding {}
```

You may then decode encrypted properties from your configuration:

```swift
MyGeneratedConfiguration.service.apiKey.decryptedString(using: MyGeneratedConfiguration.self)
```