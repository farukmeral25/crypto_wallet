import 'package:permission_handler/permission_handler.dart';

class AppPermissionHandler {
  static void requestStoragePermission() {
    Permission.storage.request();
  }
}
