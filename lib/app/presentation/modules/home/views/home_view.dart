import 'package:flutter/material.dart';
import 'package:movies_flutter/app/domain/repositories/authentication_repository.dart';
import 'package:movies_flutter/app/presentation/routes/routes.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            context.read<AuthenticationRepository>().signOut();

            Navigator.pushReplacementNamed(
              context,
              Routes.signIn,
            );
          },
          child: const Text('Sign out'),
        ),
      ),
    );
  }
}
