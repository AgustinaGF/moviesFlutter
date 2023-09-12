import 'package:movies_flutter/app/domain/models/user.dart';
import 'package:movies_flutter/app/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future<User?> getUserData() {
    return Future.value(null);
  }

  @override
  Future<bool> get isSignedIn {
    return Future.value(true);
  }
}
