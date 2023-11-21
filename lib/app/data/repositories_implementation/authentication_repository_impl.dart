import 'package:movies_flutter/app/data/services/local/session_service.dart';
import 'package:movies_flutter/app/data/services/remote/acount_api.dart';
import 'package:movies_flutter/app/data/services/remote/authentication_api.dart';
import 'package:movies_flutter/app/domain/either.dart';
import 'package:movies_flutter/app/domain/models/user/user.dart';
import 'package:movies_flutter/app/domain/repositories/authentication_repository.dart';

import '../../domain/failures/sign_in_failure.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl(
      this._authenticationAPI, this._sessionService, this._accountAPI);
  final AuthenticationAPI _authenticationAPI;
  final SessionService _sessionService;
  final AccountAPI _accountAPI;

  @override
  Future<bool> get isSignedIn async {
    final sessionId = await _sessionService.sessionId;
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
                await _sessionService.saveSessionId(sessionId);
                final user = await _accountAPI.getAccount(sessionId);
                if (user == null) {
                  return Either.left(Unknown());
                }

                return Either.right(user);
              },
            );
          },
        );
      },
    );
  }

  @override
  Future<void> signOut() async {
    return _sessionService.signOut();
  }
}
