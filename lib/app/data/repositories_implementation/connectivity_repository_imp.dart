import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:movies_flutter/app/data/services/remote/internet_checker.dart';
import 'package:movies_flutter/app/domain/repositories/connectivity_repository.dart';

class ConnectivityRepositoryImp implements ConnectivityRepository {
  final Connectivity _connectivity;
  final InternetChecker _internetChecker;

  ConnectivityRepositoryImp(
    this._connectivity,
    this._internetChecker,
  );
  @override
  Future<bool> get hasInternet async {
    final result = await _connectivity.checkConnectivity();

    if (result == ConnectivityResult.none) {
      return false;
    }
    return _internetChecker.hasInternet();
  }
}
