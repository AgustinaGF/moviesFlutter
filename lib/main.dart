import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:movies_flutter/app/data/http/http.dart';
import 'package:movies_flutter/app/data/repositories_implementation/authentication_repository_impl.dart';
import 'package:movies_flutter/app/data/repositories_implementation/connectivity_repository_imp.dart';
import 'package:movies_flutter/app/data/services/remote/authentication_api.dart';
import 'package:movies_flutter/app/data/services/remote/internet_checker.dart';
import 'package:movies_flutter/app/domain/repositories/authentication_repository.dart';
import 'package:movies_flutter/app/domain/repositories/connectivity_repository.dart';
import 'package:movies_flutter/app/my_app.dart';

void main() {
  runApp(
    Injector(
      connectivityRepository: ConnectivityRepositoryImp(
        Connectivity(),
        InternetChecker(),
      ),
      authenticationRepository: AuthenticationRepositoryImpl(
        const FlutterSecureStorage(),
        AuthenticationAPI(
          Http(
            client: http.Client(),
            baseurl: 'https://api.themoviedb.org/3',
            apiKey: '4248991ee7e5702debde74e854effa57',
          ),
        ),
      ),
      child: const Myapp(),
    ),
  );
}

class Injector extends InheritedWidget {
  const Injector({
    super.key,
    required super.child,
    required this.connectivityRepository,
    required this.authenticationRepository,
  });

  final ConnectivityRepository connectivityRepository;
  final AuthenticationRepository authenticationRepository;

  @override
  bool updateShouldNotify(_) => false;
  static Injector of(BuildContext context) {
    final injector = context.dependOnInheritedWidgetOfExactType<Injector>();
    assert(injector != null, 'Injector could not be found');
    return injector!;
  }
}
