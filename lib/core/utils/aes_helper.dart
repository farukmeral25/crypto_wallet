import 'package:encrypt/encrypt.dart' as encrypt;

class AESHelper {
  static final _key = encrypt.Key.fromLength(32);
  static final _iv = encrypt.IV.fromLength(16);

  static String encryptMnemonic(String mnemonic) {
    final encrypter = encrypt.Encrypter(encrypt.AES(_key));
    final encrypted = encrypter.encrypt(mnemonic, iv: _iv);
    return encrypted.base64;
  }

  static String decryptMnemonic(String encryptedMnemonic) {
    final encrypter = encrypt.Encrypter(encrypt.AES(_key));
    final decrypted = encrypter.decrypt(encrypt.Encrypted.fromBase64(encryptedMnemonic), iv: _iv);
    return decrypted;
  }
}
