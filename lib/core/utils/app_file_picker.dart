import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:paribu_mobile/core/extension/generic_extension.dart';
import 'package:paribu_mobile/core/utils/aes_helper.dart';
import 'package:path_provider/path_provider.dart';

class AppFilePicker {
  static Future<void> exportFile({required String password, required Map<String, dynamic> data, required String path}) async {
    String hashedPassword = _hashPassword(password);

    data.addAll({'password_hash': hashedPassword});

    String encryptedData = jsonEncode(data);

    await _saveToFile(encryptedData, path);
  }

  static Future<Map<String, dynamic>?> importFile(String password) async {
    Map<String, dynamic>? fileData = await _readFromFile();
    String hashedInputPassword = _hashPassword(password);

    return (hashedInputPassword.isEquals(fileData?["password_hash"])) ? fileData : null;
  }

  static Future<void> _saveToFile(String content, String path) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$path');

    await file.writeAsString(content);
  }

  static String _hashPassword(String password) {
    return AESHelper.encryptData(password);
  }

  static Future<Map<String, dynamic>?> _readFromFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.custom, allowedExtensions: ['json']);

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileContent = await file.readAsString();
      return jsonDecode(fileContent);
    }
    return null;
  }
}
