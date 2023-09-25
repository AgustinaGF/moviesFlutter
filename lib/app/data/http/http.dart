import 'dart:io';

import 'package:http/http.dart';
import 'package:movies_flutter/app/domain/either.dart';

class Http {
  Http(this._client, this._baseUrl, this._apiKey);
  final Client _client;
  final String _baseUrl;
  final String _apiKey;

  Future<Either<HttpFailure, String>> request(
    String path, {
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, String> queryParameters = const {},
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
      switch (method) {
        case HttpMethod.get:
          response = await _client.get(url);
        case HttpMethod.post:
          response = await _client.post(
            url,
            headers: headers,
          );
        case HttpMethod.patch:
          response = await _client.patch(url, headers: headers);
        case HttpMethod.delete:
          response = await _client.delete(url, headers: headers);
        case HttpMethod.put:
          response = await _client.put(url, headers: headers);
          break;
      }
      final statusCode = response.statusCode;
      if (statusCode >= 200 && statusCode < 300) {
        return Either.right(response.body);
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
