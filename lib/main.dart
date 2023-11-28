import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:movies_flutter/app/data/http/http.dart';
import 'package:movies_flutter/app/data/repositories_implementation/account_repository_imp.dart';
import 'package:movies_flutter/app/data/repositories_implementation/authentication_repository_impl.dart';
import 'package:movies_flutter/app/data/repositories_implementation/connectivity_repository_imp.dart';
import 'package:movies_flutter/app/data/repositories_implementation/trending_repositoty_impl.dart';
import 'package:movies_flutter/app/data/services/local/session_service.dart';
import 'package:movies_flutter/app/data/services/remote/acount_api.dart';
import 'package:movies_flutter/app/data/services/remote/authentication_api.dart';
import 'package:movies_flutter/app/data/services/remote/internet_checker.dart';
import 'package:movies_flutter/app/data/services/remote/trending_api.dart';
import 'package:movies_flutter/app/domain/repositories/account_repository.dart';
import 'package:movies_flutter/app/domain/repositories/authentication_repository.dart';
import 'package:movies_flutter/app/domain/repositories/connectivity_repository.dart';
import 'package:movies_flutter/app/domain/repositories/trending_repository.dart';
import 'package:movies_flutter/app/my_app.dart';
import 'package:movies_flutter/app/presentation/global/controllers/session_controller.dart';
import 'package:provider/provider.dart';

void main() {
  final sessionService = SessionService(
    FlutterSecureStorage(),
  );
  final http = Http(
    client: Client(),
    baseurl: 'https://api.themoviedb.org/3',
    apiKey: '4248991ee7e5702debde74e854effa57',
  );
  final accountAPI = AccountAPI(http);
  runApp(
    MultiProvider(
      providers: [
        Provider<AccountRepository>(
            create: (_) => AccountRepositoryImp(
                  accountAPI,
                  sessionService,
                )),
        Provider<ConnectivityRepository>(
          create: (_) => ConnectivityRepositoryImp(
            Connectivity(),
            InternetChecker(),
          ),
        ),
        Provider<AuthenticationRepository>(
          create: (_) => AuthenticationRepositoryImpl(
            AuthenticationAPI(http),
            sessionService,
            accountAPI,
          ),
        ),
        Provider<TrendingRepository>(
          create: (_) => TrendingRepositoryImpl(
            TrendingAPI(http),
          ),
        ),
        ChangeNotifierProvider<SessionController>(
            create: (context) =>
                SessionController(authenticationRepository: context.read()))
      ],
      child: const Myapp(),
    ),
  );
  // create: (context) => AccountRepositoryImp(),
}
