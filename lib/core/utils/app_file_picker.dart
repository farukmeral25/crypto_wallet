import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class AppFilePicker {
  static Future<void> exportFile({required String password, required Map<String, dynamic> data, required String path}) async {
    // Şifreyi SHA-256 ile hash'leyin
    String hashedPassword = _hashPassword(password);

    // Şifreli veriyi ve WalletDto'yu birleştirin
    data.addAll({'password_hash': hashedPassword});

    String encryptedData = jsonEncode(data);

    // Şifreli veriyi dosyaya kaydedin
    await _saveToFile(encryptedData, path);
  }

  static Future<Map<String, dynamic>?> importFile() async {
    Map<String, dynamic>? fileData = await _readFromFile();
    return fileData;
  }

  static Future<void> _saveToFile(String content, path) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$path');

    await file.writeAsString(content);
    print("File saved at: ${file.path}");
  }

  static String _hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  // Dosya okuma işlemi
  static Future<Map<String, dynamic>?> _readFromFile() async {
    // Dosya seçme işlemi
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileContent = await file.readAsString();
      return jsonDecode(fileContent);
    }
    return null;
  }
}
