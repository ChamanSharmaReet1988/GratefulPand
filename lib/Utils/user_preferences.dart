import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String _keyUserName = "user_name";
  static const String _keyPandaName = "panda_name";
  static const String _keyReminderTime = "reminder_time";
  static const String _keyReminderImage = "reminder_image";
  static const _keyOnboardingDone = 'is_onboarding_done';
  static const String _keyUserEmail = "user_email";
  static const String _keyLastBackupDate = "last_backup_date";

  static Future<void> saveUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserEmail, email);
  }

  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString(_keyUserEmail);

    if (email == null || email.isEmpty) {
      const dummyEmail = "tanmoy.uix@gmail.com";
      await prefs.setString(_keyUserEmail, dummyEmail);
      return prefs.getString(dummyEmail);
    }

    return prefs.getString(_keyUserEmail);
  }

  static Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserName, name);
  }

  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserName);
  }

  static Future<void> savePandarName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyPandaName, name);
  }

  static Future<String?> getPandaName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyPandaName);
  }

  static Future<void> saveReminderTime(String time, String imageName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyReminderTime, time);
    await prefs.setString(_keyReminderImage, imageName);
  }

  static Future<String?> getReminderTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyReminderTime);
  }

  static Future<String?> getReminderImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyReminderImage);
  }

  static Future<void> clearAllPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<void> setOnboardingDone(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyOnboardingDone, value);
  }

  static Future<bool> isOnboardingDone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyOnboardingDone) ?? false;
  }

  static const String _keyRitual5ThankInputData1 = "ritual_5_thank_input_1";
  static const String _keyRitual5ThankInputData2 = "ritual_5_thank_input_2";
  static const String _keyRitual5ThankInputData3 = "ritual_5_thank_input_3";

  static Future<void> setRitual5ThankInputData1(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyRitual5ThankInputData1, value);
  }

  static Future<String> getRitual5ThankInputData1() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyRitual5ThankInputData1) ?? "";
  }

  static Future<void> setRitual5ThankInputData2(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyRitual5ThankInputData2, value);
  }

  static Future<String> getRitual5ThankInputData2() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyRitual5ThankInputData2) ?? "";
  }

  static Future<void> setRitual5ThankInputData3(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyRitual5ThankInputData3, value);
  }

  static Future<String> getRitual5ThankInputData3() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyRitual5ThankInputData3) ?? "";
  }

  static const String _onboardingTwoSelectedFeels =
      "onboarding_two_selected_feels";

  static Future<void> setOnboardingTwoSelectedFeelArray(
    List<Map<String, String>> list,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(list);
    await prefs.setString(_onboardingTwoSelectedFeels, jsonString);
  }

  static Future<List<Map<String, String>>>
  getOnboardingTwoSelectedFeelArray() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_onboardingTwoSelectedFeels);
    if (jsonString == null) return [];
    final List decoded = jsonDecode(jsonString);
    return decoded.map((e) => Map<String, String>.from(e)).toList();
  }

  // Ritual 2 Preferences 'I am'
  static const String _completeYourIAm = "complete_your_i_am";

  static Future<void> setCompleteYourIAm(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_completeYourIAm, value);
  }

  static Future<String> getCompleteYourIAm() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_completeYourIAm) ?? "";
  }

  // Ritual 3 Preferences 'Today's Gratitude'
  static const String _inputTodayGratitude = "input_today_gratitude";
  static Future<void> setInputTodayGratitude(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_inputTodayGratitude, value);
  }

  static Future<String> getInputTodayGratitude() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_inputTodayGratitude) ?? "";
  }

  // Settngs Screens
  static const String _keyIsPremium = "is_premium";
  static const String _keyIsLoggedIn = "is_loggedin";
  static const String _keyIsFacelock = "is_facelock";

  static Future<void> setIsPremium(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsPremium, value);
  }

  static Future<bool> getIsPremium() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsPremium) ?? false;
  }

  static Future<void> setIsLogedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, value);
  }

  static Future<bool> getIsLogedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  static Future<void> setIsFacelock(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsFacelock, value);
  }

  static Future<bool> getIsFacelock() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsFacelock) ?? false;
  }

  static Future<void> setLastBackupDate(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLastBackupDate, value);
  }

  static Future<String?> getLastBackupDate() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyLastBackupDate);
  }

  static Future<void> resetLastBackupDate() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyLastBackupDate);
  }
}
