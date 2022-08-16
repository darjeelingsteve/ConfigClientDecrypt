//
//  UInt8Array+Decryption.swift
//  ConfigClientDecrypt
//
//  Created by Stephen Anthony on 16/08/2022.
//

import Foundation

public extension Array where Element == UInt8 {
    
    /// Returns a decrypted string representation of a series of bytes.
    /// Decryption is performed using the encryptionKey and initialization
    /// vector from the given `EncryptionKeyProviding` type.
    ///
    /// - Parameter provider: The provider of the encryption key and
    /// initialization vector.
    /// - Returns: The decrypted string.
    func decryptedString(using provider: EncryptionKeyProviding.Type) -> String {
        return decryptedString(using: provider.encryptionKey, iv: provider.encryptionKeyIV)
    }
    
    private func decryptedString(using key: [UInt8], iv: [UInt8]) -> String {
        guard let string = String(encryptedData: self, key: key, iv: iv) else {
            fatalError("Unable to decrypt byte array with given encryption key and IV - check your configuration.")
        }
        return string
    }
}

private extension String {
    init?(encryptedData: [UInt8], key: [UInt8], iv: [UInt8]) {
        let aes = AESDecrypt(key: key, iv: iv)
        guard let decodedBytes = aes.decrypt(encryptedData) else {
            return nil
        }

        self.init(bytes: decodedBytes, encoding: .utf8)
    }
}
