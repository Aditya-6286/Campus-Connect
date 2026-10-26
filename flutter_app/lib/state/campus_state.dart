import 'package:flutter/foundation.dart';

/// Holds app-wide preferences and sections a student wants to save.
class CampusState extends ChangeNotifier {
  final Set<String> _favoriteSections = <String>{};
  bool _isDarkMode = false;

  Set<String> get favoriteSections => Set.unmodifiable(_favoriteSections);
  bool get isDarkMode => _isDarkMode;

  bool isFavorite(String section) => _favoriteSections.contains(section);

  void toggleFavorite(String section) {
    if (!_favoriteSections.add(section)) {
      _favoriteSections.remove(section);
    }
    notifyListeners();
  }

  void clearFavorites() {
    if (_favoriteSections.isEmpty) return;
    _favoriteSections.clear();
    notifyListeners();
  }

  void setDarkMode(bool enabled) {
    if (_isDarkMode == enabled) return;
    _isDarkMode = enabled;
    notifyListeners();
  }
}