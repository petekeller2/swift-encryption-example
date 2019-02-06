import CryptoSwift

let key = "<YOUR KEY>"
let iv = "<YOUR IV>"

func encrypt(plaintext: String) -> String {
    do {
        let aes = try AES(key: key.bytes, blockMode: CBC(iv: iv.bytes), padding: .pkcs5)
        let ciphertext = try aes.encrypt(Array(plaintext.utf8))
        if let base64Ciphertext = ciphertext.toBase64() {
            return base64Ciphertext
        } else {
            print("Error: Could not convert ciphertext to base64")
        }
    } catch {
        print("Error: \(error)")
    }
    return ""
}

func decrypt(encryptedText: String) -> String {
    do {
        let plaintext = try encryptedText.decryptBase64ToString(cipher: AES(key: key.bytes, blockMode: CBC(iv: iv.bytes), padding: .pkcs5))
        return plaintext
    } catch {
        print("Error: \(error)")
    }
    return ""
}
