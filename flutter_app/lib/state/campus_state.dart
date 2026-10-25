import 'package:flutter/foundation.dart';

/// Holds lightweight app-wide state for sections a student wants to save.
class CampusState extends ChangeNotifier {
  final Set<String> _favoriteSections = <String>{};

  Set<String> get favoriteSections => Set.unmodifiable(_favoriteSections);

  bool isFavorite(String section) => _favoriteSections.contains(section);

  void toggleFavorite(String section) {
    if (!_favoriteSections.add(section)) {
      _favoriteSections.remove(section);
    }
    notifyListeners();
  }
}