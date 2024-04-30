import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends ChangeNotifier {
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool _isLoggedIn = false;
  static bool get isLoggedIn {
    return _prefs.getBool('loggedIn') ?? _isLoggedIn;
  }

  static set isLoggedIn(bool loggedIn) {
    _isLoggedIn = loggedIn;
    _prefs.setBool('loggedIn', _isLoggedIn);
  }

  static bool _isOnBoarded = false;
  static bool get isOnBoarded {
    return _prefs.getBool('onboarded') ?? _isOnBoarded;
  }

  static set isOnBoarded(bool onboarded) {
    _isOnBoarded = onboarded;
    _prefs.setBool('onboarded', _isOnBoarded);
  }
}
