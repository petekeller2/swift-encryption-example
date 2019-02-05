import CryptoSwift

let key = "<YOUR KEY>"
let iv = "<YOUR IV>"
let plaintext = "<YOUR PLAINTEXT>"

do {
    let aes = try AES(key: key.bytes, blockMode: CBC(iv: iv.bytes), padding: .pkcs5)
    let ciphertext = try aes.encrypt(Array(plaintext.utf8))
    if let base64Ciphertext = ciphertext.toBase64() {
        print("ciphertext: \(base64Ciphertext)")
    } else {
        print("Error: Could not convert ciphertext to base64")
    }
} catch {
    print("Error: \(error)")
}
