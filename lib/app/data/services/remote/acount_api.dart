import 'package:movies_flutter/app/data/http/http.dart';
import 'package:movies_flutter/app/domain/models/user/user.dart';

class AccountAPI {
  AccountAPI(this._http);

  final Http _http;

  Future<User?> getAccount(String sesionId) async {
    final result = await _http.request(
      '/account',
      queryParameters: {
        'session_id': sesionId,
      },
      onSuccess: (json) {
        return User.fromJson(json);
      },
    );
    return result.when(
      left: (_) => null,
      right: (user) => user,
    );
  }
}
