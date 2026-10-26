import 'package:shared_preferences/shared_preferences.dart';
import 'package:campus_connect/state/campus_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });
  group('CampusState', () {
    test('toggles a section between saved and unsaved', () {
      final state = CampusState();

      expect(state.isFavorite('Events'), isFalse);
      state.toggleFavorite('Events');
      expect(state.isFavorite('Events'), isTrue);
      expect(state.favoriteSections, contains('Events'));

      state.toggleFavorite('Events');
      expect(state.isFavorite('Events'), isFalse);
      expect(state.favoriteSections, isEmpty);
    });

    test('notifies listeners after a toggle', () {
      final state = CampusState();
      var notifications = 0;
      state.addListener(() => notifications++);

      state.toggleFavorite('Notices');

      expect(notifications, 1);
    });
  });
}
