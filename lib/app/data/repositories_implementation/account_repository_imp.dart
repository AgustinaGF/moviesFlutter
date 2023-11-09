import 'package:movies_flutter/app/data/services/remote/acount_api.dart';
import 'package:movies_flutter/app/domain/models/user.dart';
import 'package:movies_flutter/app/domain/repositories/account_repository.dart';

import '../services/local/session_service.dart';

class AccountRepositoryImp implements AccountRepository {
  AccountRepositoryImp(this._accountAPI, this._sessionService);

  final AccountAPI _accountAPI;
  final SessionService _sessionService;
  @override
  Future<User?> getUserData() async {
    final sessionId = await _sessionService.sessionId;
    _accountAPI.getAccount(
      sessionId ?? '',
    );
    return null;
  }
}
