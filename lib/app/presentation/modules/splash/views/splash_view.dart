import 'package:flutter/material.dart';
import 'package:movies_flutter/app/domain/repositories/account_repository.dart';
import 'package:movies_flutter/app/domain/repositories/authentication_repository.dart';
import 'package:movies_flutter/app/domain/repositories/connectivity_repository.dart';
import 'package:movies_flutter/app/presentation/global/controllers/session_controller.dart';
import 'package:movies_flutter/app/presentation/routes/routes.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _init();
      },
    );
  }

  Future<void> _init() async {
    final routeName = await () async {
      final ConnectivityRepository connectivityRepository = context.read();
      final AuthenticationRepository authenticationRepository = context.read();
      final AccountRepository accountRepository = context.read();
      final SessionController sessionController = context.read();
      final hasInternet = await connectivityRepository.hasInternet;

      if (!hasInternet) {
        return Routes.offline;
      }

      final isSigned = await authenticationRepository.isSignedIn;

      if (!isSigned) {
        return Routes.signIn;
      }

      final user = await accountRepository.getUserData();

      if (user != null) {
        sessionController.setUser(user);
        return Routes.home;
      }
      return Routes.signIn;
    }();

    if (mounted) {
      _goTo(routeName);
    }
  }

  void _goTo(routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
