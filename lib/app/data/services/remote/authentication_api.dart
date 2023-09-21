import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:movies_flutter/app/domain/either.dart';
import 'package:movies_flutter/app/domain/repositories/enums.dart';

class AuthenticationAPI {
  AuthenticationAPI(this._client);
  final Client _client;
  final _baseUrl = 'https://api.themoviedb.org/3';
  final _apiKey = 'sarasa';

  Future<String?> createRequestToken() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/authentication/token/new?api_key=$_apiKey'),
      );

      if (response.statusCode == 200) {
        final json = Map<String, dynamic>.from(jsonDecode(response.body));

        return json['request_token'];
      }
      return null;
    } catch (e) {
      print('error ${e}');
      return null;
    }
  }

  Future<Either<SignInFailure, String>> createSessionWithLogin(
      {required String username,
      required String password,
      required String requestToken}) async {
    try {
      final response = await _client.post(
          Uri.parse(
              '$_baseUrl/authentication/token/validate_with_login?api_key=$_apiKey'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            "username": username,
            "password": password,
            "request_token": requestToken,
          }));
      switch (response.statusCode) {
        case 200:
          final json = Map<String, dynamic>.from(
            jsonDecode(response.body),
          );
          final newRequestToken = json['request_token'] as String;
          return Either.right(newRequestToken);
        case 401:
          return Either.left(SignInFailure.unauthorized);
        case 404:
          return Either.left(SignInFailure.notFound);

        default:
          return Either.left(SignInFailure.unknown);
      }
    } catch (e) {
      if (e is SocketException) {
        return Either.left(
          SignInFailure.network,
        );
      }
      return Either.left(SignInFailure.unknown);
    }
  }
}
