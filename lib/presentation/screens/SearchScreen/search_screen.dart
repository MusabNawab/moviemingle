import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviemingle/logic/search_api_provider.dart';
import 'package:moviemingle/presentation/widgets/movie_grid.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder: (context, ref, _) {
            return Container(
              margin: const EdgeInsets.fromLTRB(15, 16, 15, 0),
              child: SearchBar(
                hintText: 'Search',
                trailing: const [Icon(Icons.search)],
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20)),
                onChanged: (value) {
                  ref
                      .read(searchQueryProvider.notifier)
                      .update((state) => value);
                },
              ),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(child: Consumer(
          builder: (context, ref, _) {
            final searchAsyncVal = ref.watch(searchDataFutureProvider);
            return searchAsyncVal.when(
              data: (data) {
                if (data != null) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: MovieGrid(movies: data),
                  );
                }
                if (data!.isEmpty) {
                  return const Text("0 results found");
                }
                return Container();
              },
              error: (error, stackTrace) => const Text("0 results found"),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ))
      ],
    );
  }
}
