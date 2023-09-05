import 'package:flutter/material.dart';
import 'package:movies_flutter/app/presentation/routes/app_routes.dart';
import 'package:movies_flutter/app/presentation/routes/routes.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.splash,
      routes: appRoutes,
    );
  }
}
