import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:movies_flutter/app/domain/either.dart';

class Http {
  Http({
    required Client client,
    required String baseurl,
    required String apiKey,
  })  : _client = client,
        _apiKey = apiKey,
        _baseUrl = baseurl;

  final Client _client;
  final String _baseUrl;
  final String _apiKey;

  Future<Either<HttpFailure, R>> request<R>(
    String path, {
    required R Function(String responseBody) onSuccess,
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, String> queryParameters = const {},
    Map<String, dynamic> body = const {},
    bool useApiKey = true,
  }) async {
    try {
      if (useApiKey) {
        queryParameters = {...queryParameters, 'api_key': _apiKey};
      }
      Uri url = Uri.parse(
        path.startsWith('http') ? path : '$_baseUrl$path',
      );
      if (queryParameters.isNotEmpty) {
        url = url.replace(
          queryParameters: queryParameters,
        );
      }
      headers = {
        'Content-Type': 'application/json',
        ...headers,
      };
      late final Response response;
      final bodyString = jsonEncode(body);
      switch (method) {
        case HttpMethod.get:
          response = await _client.get(url);
        case HttpMethod.post:
          response = await _client.post(
            url,
            headers: headers,
            body: bodyString,
          );
        case HttpMethod.patch:
          response = await _client.patch(
            url,
            headers: headers,
            body: bodyString,
          );
        case HttpMethod.delete:
          response = await _client.delete(
            url,
            headers: headers,
            body: bodyString,
          );
        case HttpMethod.put:
          response = await _client.put(
            url,
            headers: headers,
            body: bodyString,
          );
          break;
      }
      final statusCode = response.statusCode;
      if (statusCode >= 200 && statusCode < 300) {
        return Either.right(
          onSuccess(response.body),
        );
      }
      return Either.left(
        HttpFailure(
          statusCode: statusCode,
        ),
      );
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        return Either.left(
          HttpFailure(
            exception: NetworkException(),
          ),
        );
      }
      return Either.left(
        HttpFailure(
          exception: e,
        ),
      );
    }
  }
}

class HttpFailure {
  HttpFailure({
    this.statusCode,
    this.exception,
  });
  final int? statusCode;
  final Object? exception;
}

class NetworkException {}

enum HttpMethod { get, post, patch, delete, put }
