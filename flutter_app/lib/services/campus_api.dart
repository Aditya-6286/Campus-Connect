import 'dart:convert';

import 'package:http/http.dart' as http;

class CampusNotice {
  const CampusNotice({
    required this.id,
    required this.title,
    required this.body,
  });

  final int id;
  final String title;
  final String body;

  factory CampusNotice.fromJson(Map<String, dynamic> json) {
    return CampusNotice(
      id: json['id'] as int,
      title: (json['title'] as String?) ?? 'Untitled notice',
      body: (json['body'] as String?) ?? '',
    );
  }
}

class CampusApi {
  CampusApi({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  static final Uri _noticesUri = Uri.https(
    'jsonplaceholder.typicode.com',
    '/posts',
    {'_limit': '8'},
  );

  Future<List<CampusNotice>> fetchNotices() async {
    final response = await _client
        .get(_noticesUri, headers: const {'Accept': 'application/json'})
        .timeout(const Duration(seconds: 12));

    if (response.statusCode != 200) {
      throw Exception('Notice service returned ${response.statusCode}.');
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! List) {
      throw const FormatException('Unexpected notice response format.');
    }

    return decoded
        .whereType<Map<String, dynamic>>()
        .map(CampusNotice.fromJson)
        .toList(growable: false);
  }

  void dispose() => _client.close();
}
