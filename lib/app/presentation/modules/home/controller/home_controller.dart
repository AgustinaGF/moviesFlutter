import 'package:movies_flutter/app/domain/repositories/trending_repository.dart';
import 'package:movies_flutter/app/presentation/global/state_notifier.dart';
import 'package:movies_flutter/app/presentation/modules/home/controller/state/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController(super.state, {required this.trendingRepository});
  final TrendingRepository trendingRepository;

  Future<void> init() async {
    final result = await trendingRepository.getMoviesAndSeries(
      state.timeWindow,
    );
    result.when(
      left: (_) {
        state = HomeState.failed(state.timeWindow);
      },
      right: (list) {
        state = HomeState.loaded(
          timeWindow: state.timeWindow,
          moviesAndSeries: list,
        );
      },
    );
  }
}
