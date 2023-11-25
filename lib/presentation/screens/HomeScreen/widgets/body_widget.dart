import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviemingle/logic/api_provider.dart';
import 'package:moviemingle/presentation/widgets/movie_grid.dart';

class BodyWidget extends ConsumerWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(apiDataProvider);
    return movies.when(
      data: (data) {
        if (data == null) {
          return const Center(
            child: Text("Nothing to show"),
          );
        }
        return MovieGrid(movies: data);
      },
      error: (error, stackTrace) {
        return const Center(
          child: Text("Something went wrong"),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
