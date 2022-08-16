//
//  AESDecrypt.swift
//  ConfigClientDecrypt
//
//  Created by Stephen Anthony on 16/08/2022.
//

import CommonCrypto
import Foundation

/// Provides AES128 decryption functions.
final class AESDecrypt {
    private let key: [UInt8]
    private let iv: [UInt8]

    init(key: [UInt8], iv: [UInt8]) {
        self.key = key
        self.iv = iv
    }
    
    
    /// Decrypts the given byte sequence using the key and initialization
    /// vector that the receiver was initialised with.
    /// - Parameter data: The data to decrypt as a series of bytes.
    /// - Returns: The decrypted byte stream, or `nil` if decryption fails.
    func decrypt(_ data: [UInt8]) -> [UInt8]? {
        let cryptLength = size_t(data.count + size_t(kCCBlockSizeAES128))
        var cryptData = [UInt8](repeating: 0, count: cryptLength)

        var numBytesEncrypted: size_t = 0

        let cryptStatus = CCCrypt(CCOperation(kCCDecrypt),
                                  UInt32(kCCAlgorithmAES),
                                  UInt32(kCCOptionPKCS7Padding),
                                  key,
                                  size_t(kCCKeySizeAES128),
                                  iv,
                                  data,
                                  data.count,
                                  &cryptData,
                                  cryptLength,
                                  &numBytesEncrypted)

        if UInt32(cryptStatus) == UInt32(kCCSuccess) {
            cryptData.removeSubrange(numBytesEncrypted..<cryptData.count)
        }

        return cryptData
    }
}
