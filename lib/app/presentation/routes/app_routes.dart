import 'package:flutter/widgets.dart';
import 'package:movies_flutter/app/presentation/modules/home/views/home_view.dart';
import 'package:movies_flutter/app/presentation/modules/offline/offline_view.dart';
import 'package:movies_flutter/app/presentation/modules/sign_in/views/sign_in_view.dart';

import '../modules/splash/views/splash_view.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (context) => const SplashView(),
    Routes.signIn: (context) => const SignInView(),
    Routes.home: (context) => const HomeView(),
    Routes.offline: (context) => const Offline(),
  };
}
