import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:filmflix/core/config/themes/app_colors.dart';

class ThemeStorage {
  // *****************************
  static const String _brightnessKey = "ThemeBrightness";
  static Future<Brightness> getBrightness() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? brightnessValue = prefs.getInt(_brightnessKey);
    return brightnessValue == 1 ? Brightness.dark : Brightness.light;
  }

  static Future<void> setBrightness(Brightness brightness) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_brightnessKey, brightness == Brightness.dark ? 1 : 0);
  }

  // *****************************
  static const String _useMaterial3Key = "ThemeUseMaterial3";
  static Future<bool> getUseMaterial3() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_useMaterial3Key) ?? true;
  }

  static Future<void> setUseMaterial3(bool useMaterial3) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_useMaterial3Key, useMaterial3);
  }

  // *****************************
  static const String _colorKey = "ThemeColor";
  static Future<Color> getColor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? colorValue = prefs.getInt(_colorKey);
    return colorValue != null ? Color(colorValue) : AppColors.primary;
  }

  static Future<void> setColor(Color color) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_colorKey, color.value);
  }
}
