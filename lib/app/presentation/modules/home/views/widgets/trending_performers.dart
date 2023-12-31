import 'package:flutter/material.dart';
import 'package:movies_flutter/app/domain/either/either.dart';
import 'package:movies_flutter/app/domain/failures/http_request_failure/http_request_failure.dart';
import 'package:movies_flutter/app/domain/models/performer/performer.dart';
import 'package:movies_flutter/app/domain/repositories/trending_repository.dart';
import 'package:provider/provider.dart';

typedef EitherListPerformer = Either<HttpRequestFailure, List<Performer>>;

class TrendingPerformers extends StatefulWidget {
  const TrendingPerformers({super.key});

  @override
  State<TrendingPerformers> createState() => _TrendingPerformersState();
}

class _TrendingPerformersState extends State<TrendingPerformers> {
  late Future<EitherListPerformer> _future;

  @override
  void initState() {
    super.initState();
    _future = context.read<TrendingRepository>().getPerformers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<EitherListPerformer>(
      future: _future,
      builder: (_, snapshop) {
        if (!snapshop.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return snapshop.data!.when(
          left: (_) => Text('Error'),
          right: (list) => Text('Performers'),
        );
      },
    );
  }
}
