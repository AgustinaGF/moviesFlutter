import 'package:flutter/widgets.dart';
import 'package:movies_flutter/app/data/repositories_implementation/authentication_repository_impl.dart';
import 'package:movies_flutter/app/data/repositories_implementation/connectivity_repository_imp.dart';
import 'package:movies_flutter/app/domain/repositories/authentication_repository.dart';
import 'package:movies_flutter/app/domain/repositories/connectivity_repository.dart';
import 'package:movies_flutter/app/my_app.dart';

void main() {
  runApp(
    Injector(
      connectivityRepository: ConnectivityRepositoryImp(),
      authenticationRepository: AuthenticationRepositoryImpl(),
      child: const Myapp(),
    ),
  );
}

class Injector extends InheritedWidget {
  const Injector({
    super.key,
    required super.child,
    required this.connectivityRepository,
    required this.authenticationRepository,
  });

  final ConnectivityRepository connectivityRepository;
  final AuthenticationRepository authenticationRepository;

  @override
  bool updateShouldNotify(_) => false;
  static Injector of(BuildContext context) {
    final injector = context.dependOnInheritedWidgetOfExactType<Injector>();
    assert(injector != null, 'Injector could not be found');
    return injector!;
  }
}
