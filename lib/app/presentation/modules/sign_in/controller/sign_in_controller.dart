import 'package:movies_flutter/app/domain/either.dart';
import 'package:movies_flutter/app/domain/models/user/user.dart';
import 'package:movies_flutter/app/domain/repositories/authentication_repository.dart';
import 'package:movies_flutter/app/domain/repositories/enums.dart';
import 'package:movies_flutter/app/presentation/global/state_notifier.dart';
import 'package:movies_flutter/app/presentation/modules/sign_in/controller/sign_in_state.dart';

class SignInController extends StateNotifier<SignInState> {
  SignInController(super.state, {required this.authenticationRepository});

  final AuthenticationRepository authenticationRepository;
  void onUsernameChanged(String text) {
    onlyUpdate(
      state.copyWith(
        username: text.trim().toLowerCase(),
      ),
    );
  }

  void onPasswordChanged(String text) {
    onlyUpdate(state.copyWith(
      password: text.replaceAll('', ''),
    ));
  }

  Future<Either<SignInFailure, User>> submit() async {
    state = state.copyWith(fetching: true);
    final result =
        await authenticationRepository.signIn(state.username, state.password);
    result.when(
      (_) => state = state.copyWith(fetching: false),
      (_) => null,
    );
    return result;
  }
}
