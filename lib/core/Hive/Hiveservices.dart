import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox('authBox');
  }

  static Future<void> close() async {
    await Hive.close();
  }
  static Future<void> reset() async {
    await Hive.deleteBoxFromDisk('authBox');
    await init();
  }
}