import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:paribu_mobile/core/extension/string_extension.dart';
import 'package:paribu_mobile/core/init/injection_container.dart';
import 'package:paribu_mobile/core/utils/device_manager.dart';

class AESHelper {
  Future<void> initialize() async {
    final String? id = sl<DeviceInfo>().deviceId;
    String deviceIdBase64 = base64Encode(utf8.encode(id.getValueOrDefault));

    String truncatedKey = deviceIdBase64.substring(0, 32);
    key = Key.fromBase64(truncatedKey);
  }

  late final Key key;

  String encryptData(String data) {
    final encrypter = Encrypter(AES(key));
    final iv = IV.fromLength(16);
    final encrypted = encrypter.encrypt(data, iv: iv);

    return base64Encode(iv.bytes + encrypted.bytes);
  }

  String decryptData(String data) {
    final encrypter = Encrypter(AES(key));
    final encryptedBytes = base64Decode(data);

    final iv = IV(encryptedBytes.sublist(0, 16));
    final encryptedData = Encrypted(encryptedBytes.sublist(16));

    final decrypted = encrypter.decrypt(encryptedData, iv: iv);
    return decrypted;
  }
}
