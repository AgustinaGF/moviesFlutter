import 'package:movies_flutter/app/domain/models/user.dart';

abstract class AccountRepository {
  Future<User?> getUserData();
}
