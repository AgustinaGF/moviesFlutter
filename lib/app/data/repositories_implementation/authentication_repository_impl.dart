import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movies_flutter/app/data/services/remote/authentication_api.dart';
import 'package:movies_flutter/app/domain/either.dart';
import 'package:movies_flutter/app/domain/models/user.dart';
import 'package:movies_flutter/app/domain/repositories/authentication_repository.dart';
import 'package:movies_flutter/app/domain/repositories/enums.dart';

const _key = 'sessionId';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FlutterSecureStorage _secureStorage;
  final AuthenticationAPI _authenticationAPI;

  AuthenticationRepositoryImpl(this._secureStorage, this._authenticationAPI);

  @override
  Future<User?> getUserData() {
    return Future.value(
      User(),
    );
  }

  @override
  Future<bool> get isSignedIn async {
    final sessionId = await _secureStorage.read(key: _key);
    return sessionId != null;
    // return Future.value(true);
  }

  @override
  Future<Either<SignInFailure, User>> signIn(
    String username,
    String password,
  ) async {
    final requestToken = await _authenticationAPI.createRequestToken();
    if (requestToken == null) {
      return Either.left(SignInFailure.unknown);
    }

    final loginResult = await _authenticationAPI.createSessionWithLogin(
        username: username, password: password, requestToken: requestToken);

    return loginResult.when(
      (failure) {
        return Either.left(failure);
      },
      (newRequestToken) {
        return Either.right(User());
      },
    );
  }

  @override
  Future<void> signOut() async {
    return _secureStorage.delete(key: _key);
  }
}
