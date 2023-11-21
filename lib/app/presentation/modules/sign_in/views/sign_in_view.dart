import 'package:flutter/material.dart';
import 'package:movies_flutter/app/domain/repositories/authentication_repository.dart';
import 'package:movies_flutter/app/presentation/modules/sign_in/controller/sign_in_controller.dart';
import 'package:movies_flutter/app/presentation/modules/sign_in/controller/state/sign_in_state.dart';
import 'package:movies_flutter/app/presentation/modules/sign_in/views/widgets/submit_button.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInController>(
      create: (_) => SignInController(
        SignInState(username: '', password: '', fetching: false),
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              child: Builder(builder: (context) {
                final controller = Provider.of<SignInController>(context);
                return AbsorbPointer(
                  absorbing: controller.state.fetching,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (text) {
                          controller.onUsernameChanged(text);
                        },
                        decoration: const InputDecoration(hintText: 'username'),
                        validator: (text) {
                          text = text?.trim().toLowerCase() ?? '';
                          if (text.isEmpty) {
                            return 'Invalid username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (text) {
                          controller.onPasswordChanged(text);
                        },
                        decoration: const InputDecoration(hintText: 'password'),
                        validator: (text) {
                          text = text?.replaceAll('', '') ?? '';
                          if (text.length < 4) {
                            return 'Invalid password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const SubmitButton(),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
