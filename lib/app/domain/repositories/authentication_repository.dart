import 'package:movies_flutter/app/domain/models/user.dart';

abstract class AuthenticationRepository {
  Future<bool> get isSignedInl;
  Future<User> getUserData();
}
