import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  /// Making the Private Constructor for [SharedPreference] class
  SharedPreference._();

  /// Assigning the Instance of [SharedPreference] to [_instance]
  static final SharedPreference _instance = SharedPreference._();

  /// Getter of Instance of [SharedPreference] Singleton Class
  factory SharedPreference() => _instance;

  /// [_prefs] stores the instance of [SharedPreferences]
  late SharedPreferences _prefs;

  /// Assign Instance of [SharedPreferences] to [_prefs]
  init() async{
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save an String value to key.
  Future<bool> saveString({required String key, required String value}) async {
    bool isSet = await _prefs.setString(key, value);
    return isSet;
  }

  /// Try reading data from the [key]. If it doesn't exist, returns null.
  String? getString({required String key}){
    return _prefs.getString(key);
  }

  /// Remove data for the [key].
  removeKey({required String key}) async {
    await _prefs.remove(key);
  }
}