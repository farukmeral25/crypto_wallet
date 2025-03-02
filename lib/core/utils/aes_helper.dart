import 'package:encrypt/encrypt.dart' as encrypt;

class AESHelper {
  static final _key = encrypt.Key.fromLength(32);
  static final _iv = encrypt.IV.fromLength(16);

  static String encryptData(String data) {
    final encrypter = encrypt.Encrypter(encrypt.AES(_key));
    final encrypted = encrypter.encrypt(data, iv: _iv);
    return encrypted.base64;
  }

  static String decryptData(String data) {
    final encrypter = encrypt.Encrypter(encrypt.AES(_key));
    final decrypted = encrypter.decrypt(encrypt.Encrypted.fromBase64(data), iv: _iv);
    return decrypted;
  }
}
