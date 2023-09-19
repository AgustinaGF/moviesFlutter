import 'dart:convert';

import 'package:http/http.dart';

class AuthenticationAPI {
  AuthenticationAPI(this._client);
  final Client _client;
  final _baseUrl = 'https://api.themoviedb.org/3';
  final _apiKey = 'sarasa';
  final _header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer _apiKey',
  };

  createRequestToken() async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/authentication/token/new'),
      headers: _header,
    );
    if (response.statusCode == 200) {
      jsonDecode(response.body);
    }
  }
}
