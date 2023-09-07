import 'package:flutter/material.dart';
import 'package:movies_flutter/main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback(
      (_) {
        _init();
      },
    );
  }

  Future<void> _init() async {
    final injector = Injector.of(context);
    final connectivityRepository = injector.connectivityRepository;
    final hasInternet = await connectivityRepository.hasInternet;

    if (hasInternet) {
      final authenticationRepository = injector.authenticationRepository;
      final isSigned = await authenticationRepository.isSignedInl;
      if (isSigned) {}
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SizedBox(
              width: 80, height: 80, child: CircularProgressIndicator())),
    );
  }
}
