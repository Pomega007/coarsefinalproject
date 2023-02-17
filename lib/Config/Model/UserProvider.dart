import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'UserData.dart';

class UserID{
  static SharedPreferences? _preferences;
  static const _KeyUser = 'User';
  static const MyUser = User(
    ImagePath: '',
    Name: '',
    Email: '',
    About: '',
    isDark: false, );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences?.setString(_KeyUser, json);
  }

  static User getUser() {
    final json = _preferences?.getString(_KeyUser);

    return json == null ? MyUser : User.fromJson(jsonDecode(json));
  }
}