import 'package:movies_flutter/app/domain/models/user/user.dart';

abstract class AccountRepository {
  Future<User?> getUserData();
}
