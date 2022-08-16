//
//  EncryptionKeyProviding.swift
//  ConfigClientDecrypt
//
//  Created by Stephen Anthony on 16/08/2022.
//

import Foundation

/// The protocol to conform to when providing encryption keys for the purpose of
/// decrypting encrypted properties from a Config configuration.
///
/// To use this protocol, first add an `encryptionKey` property to your
/// configuration as follows:
///
/// ```json
/// "encryptionKey": {
///   "type": "EncryptionKey",
///   "defaultValue": "<your-encryption-key>"
/// }
/// ```
/// Then, add an extension to your generated configuration enum:
///
/// ```swift
/// extension MyGeneratedConfiguration: EncryptionKeyProviding {}
/// ```
///
/// You may then decode encrypted properties from your configuration:
///
/// ```swift
/// MyGeneratedConfiguration.service.apiKey.decryptedString(using: MyGeneratedConfiguration.self)
/// ```
public protocol EncryptionKeyProviding {
    
    /// The encryption key used to encode secrets in the configuration.
    static var encryptionKey: [UInt8] { get }
    
    /// The initialization vector used when decoding encrypted secrets.
    static var encryptionKeyIV: [UInt8] { get }
}
