import 'package:campus_connect/services/campus_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('CampusApi.fetchNotices', () {
    test('parses a successful JSON response', () async {
      final api = CampusApi(
        client: MockClient((request) async {
          expect(request.url.host, 'jsonplaceholder.typicode.com');
          return http.Response(
            '[{"id":1,"title":"Library hours","body":"Library closes at 6 PM."}]',
            200,
            headers: {'content-type': 'application/json'},
          );
        }),
      );
      addTearDown(api.dispose);

      final notices = await api.fetchNotices();

      expect(notices, hasLength(1));
      expect(notices.single.title, 'Library hours');
      expect(notices.single.id, 1);
    });

    test('throws when the service returns a non-success status', () async {
      final api = CampusApi(
        client: MockClient(
          (request) async => http.Response('Service unavailable', 503),
        ),
      );
      addTearDown(api.dispose);

      expect(api.fetchNotices(), throwsException);
    });

    test('rejects an unexpected JSON response shape', () async {
      final api = CampusApi(
        client: MockClient(
          (request) async => http.Response('{"message":"not a list"}', 200),
        ),
      );
      addTearDown(api.dispose);

      expect(api.fetchNotices(), throwsFormatException);
    });
  });
}
