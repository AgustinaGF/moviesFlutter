import 'package:flutter/material.dart';
import 'package:movies_flutter/app/domain/repositories/authentication_repository.dart';
import 'package:movies_flutter/app/domain/repositories/enums.dart';
import 'package:movies_flutter/app/presentation/modules/sign_in/controller/sign_in_controller.dart';
import 'package:movies_flutter/app/presentation/routes/routes.dart';
import 'package:provider/provider.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Provider.of(context);
    if (controller.state.fetching) {
      return const CircularProgressIndicator();
    }
    return MaterialButton(
      onPressed: () {
        final isValid = Form.of(context).validate();
        if (isValid) {
          _submit(context);
        }
      },
      color: Colors.blue,
      child: Text('Sign in'),
    );
  }

  Future<void> _submit(BuildContext context) async {
    final SignInController controller = context.read();

    controller.onFetchingChanged(true);

    final result = await context
        .read<AuthenticationRepository>()
        .signIn(controller.state.username, controller.state.password);

    if (!controller.mounted) {
      return;
    }

    result.when(
      (failure) {
        controller.onFetchingChanged(false);
        final message = {
          SignInFailure.notFound: 'Not Found',
          SignInFailure.unauthorized: 'Invalid password',
          SignInFailure.unknown: 'Error',
          SignInFailure.network: 'Network error'
        }[failure];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message!)),
        );
      },
      (user) {
        Navigator.pushReplacementNamed(context, Routes.home);
      },
    );
  }
}
