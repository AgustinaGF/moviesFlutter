import 'package:flutter/material.dart';
import 'package:movies_flutter/app/presentation/global/controllers/session_controller.dart';
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

    final result = await controller.submit();

    if (!controller.mounted) {
      return;
    }

    result.when(
      left: (failure) {
        final message = failure.when(
            notFound: () => 'Not Found',
            network: () => 'Network error',
            unathorized: () => 'Invalid password',
            unknow: () => 'Error',
            notVerified: () => 'Email not verified');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      },
      right: (user) {
        final SessionController sessionController = context.read();
        sessionController.setUser(user);
        Navigator.pushReplacementNamed(context, Routes.home);
      },
    );
  }
}
