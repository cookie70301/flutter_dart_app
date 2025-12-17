// theme_provider.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// 匯入自訂主題
import 'theme_data.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  // Getter: 應用程式判斷該使用哪個主題的依據
  ThemeData get currentTheme => _isDarkMode ? darkTheme() : lightTheme();

  bool get isDarkMode => _isDarkMode;

  // 構造函數：應用程式啟動時載入儲存的設定
  ThemeProvider() {
    _loadFromPrefs();
  }

  // 方法：切換主題並儲存
  void toggleTheme(bool value) {
    _isDarkMode = value;
    _saveToPrefs(); // 呼叫儲存函數
    notifyListeners(); // 通知所有監聽者更新 UI
  }

  // --- 持久化邏輯 (與前例相同) ---
  _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
  }
}