import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter/app/domain/either/either.dart';
import 'package:movies_flutter/app/domain/failures/http_request_failure/http_request_failure.dart';
import 'package:movies_flutter/app/domain/models/performer/performer.dart';
import 'package:movies_flutter/app/domain/repositories/trending_repository.dart';
import 'package:movies_flutter/app/presentation/global/utils/get_image_url.dart';
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
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      child: FutureBuilder<EitherListPerformer>(
        future: _future,
        builder: (_, snapshop) {
          if (!snapshop.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return snapshop.data!.when(
            left: (_) => const Text('Error'),
            right: (list) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final performer = list[index];
                return SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ExtendedImage.network(
                                getImageUrl(performer.profilePath)),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: list.length,
            ),
          );
        },
      ),
    );
  }
}
