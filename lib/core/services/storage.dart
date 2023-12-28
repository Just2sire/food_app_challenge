import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static SharedPreferences? _storageData;

  static final Storage _storage = Storage();

    static SharedPreferences? get storageData => _storageData;

  static Future<void> init() async {
    _storageData ??= await SharedPreferences.getInstance();
  }

  factory Storage() {
    init();
    return _storage;
  }
}
