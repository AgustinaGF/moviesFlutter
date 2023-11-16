import 'package:movies_flutter/app/domain/models/user/user.dart';
import 'package:movies_flutter/app/domain/repositories/authentication_repository.dart';
import 'package:movies_flutter/app/presentation/global/state_notifier.dart';

class SessionController extends StateNotifier<User?> {
  SessionController({
    required this.authenticationRepository,
  }) : super(null);

  final AuthenticationRepository authenticationRepository;

  void setUser(User user) {
    state = user;
  }

  Future<void> signOut() async {
    authenticationRepository.signOut();
    onlyUpdate(null);
  }
}
