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
    final requestTokenResult = await _authenticationAPI.createRequestToken();
    return requestTokenResult.when(
      (failure) => Either.left(failure),
      (requestToken) async {
        final loginResult = await _authenticationAPI.createSessionWithLogin(
          username: username,
          password: password,
          requestToken: requestToken,
        );

        return loginResult.when(
          (failure) async => Either.left(failure),
          (newRequestToken) async {
            final sessionResult = await _authenticationAPI.createSession(
              newRequestToken,
            );
            return sessionResult.when(
              (failure) async => Either.left(failure),
              (sessionId) async {
                await _secureStorage.write(
                  key: _key,
                  value: sessionId,
                );
                return Either.right(
                  User(),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Future<void> signOut() async {
    return _secureStorage.delete(key: _key);
  }
}
