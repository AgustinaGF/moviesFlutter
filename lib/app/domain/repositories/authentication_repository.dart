import 'package:movies_flutter/app/domain/either.dart';
import 'package:movies_flutter/app/domain/models/user/user.dart';

import '../failures/sign_in_failure.dart';

abstract class AuthenticationRepository {
  Future<bool> get isSignedIn;
  Future<void> signOut();
  Future<Either<SignInFailure, User>> signIn(String username, String password);
}
