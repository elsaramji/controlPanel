// components/auth/forgetpassword/logic/open_other_apps.dart
import 'package:new_device_apps/device_apps.dart';

class OpenOtherApps {
  static Future<void> openAppByPackageName(String packageName) async {
    await DeviceApps.openApp(packageName);
  }
}
