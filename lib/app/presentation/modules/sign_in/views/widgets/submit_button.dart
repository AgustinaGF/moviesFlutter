import 'package:flutter/material.dart';
import 'package:movies_flutter/app/domain/failures/sign_in_failure.dart';
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
      (failure) {
        final message = () {
          if (failure is NotFound) {
            return 'Not Found';
          }
          if (failure is Unauthorized) {
            return 'Invalid password';
          }
          if (failure is Network) {
            return 'Error';
          }
          if (failure is Unknown) {
            return 'Network error';
          }
          return 'Error';
        }();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      },
      (user) {
        final SessionController sessionController = context.read();
        sessionController.setUser(user);
        Navigator.pushReplacementNamed(context, Routes.home);
      },
    );
  }
}
