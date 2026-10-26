import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// App-wide preferences and saved sections, persisted on this device.
class CampusState extends ChangeNotifier {
  static const _favoritesKey = 'campus_connect.favorite_sections';
  static const _darkModeKey = 'campus_connect.dark_mode';

  final Set<String> _favoriteSections = <String>{};
  bool _isDarkMode = false;

  CampusState() {
    _loadPreferences();
  }

  Set<String> get favoriteSections => Set.unmodifiable(_favoriteSections);
  bool get isDarkMode => _isDarkMode;

  Future<void> _loadPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _favoriteSections
        ..clear()
        ..addAll(prefs.getStringList(_favoritesKey) ?? const <String>[]);
      _isDarkMode = prefs.getBool(_darkModeKey) ?? false;
      notifyListeners();
    } catch (_) {
      // Keep the app usable if local storage is unavailable (e.g. test runner).
    }
  }

  bool isFavorite(String section) => _favoriteSections.contains(section);

  void toggleFavorite(String section) {
    if (!_favoriteSections.add(section)) {
      _favoriteSections.remove(section);
    }
    notifyListeners();
    _saveFavorites();
  }

  void clearFavorites() {
    if (_favoriteSections.isEmpty) return;
    _favoriteSections.clear();
    notifyListeners();
    _saveFavorites();
  }

  void setDarkMode(bool enabled) {
    if (_isDarkMode == enabled) return;
    _isDarkMode = enabled;
    notifyListeners();
    SharedPreferences.getInstance().then(
      (prefs) => prefs.setBool(_darkModeKey, enabled),
    ).catchError((_) {});
  }

  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_favoritesKey, _favoriteSections.toList());
    } catch (_) {
      // State still works for the current session if storage is unavailable.
    }
  }
}