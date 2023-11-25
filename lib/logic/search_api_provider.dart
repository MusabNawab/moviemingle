import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/movies.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchDataFutureProvider = FutureProvider.autoDispose((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.isEmpty) {
    // Return an empty list or default data if the search query is empty
    return <Movies>[];
  }

  final dio = Dio();
  final response =
      await dio.get('https://api.tvmaze.com/search/shows?q=$query');
  if (response.statusCode == 200) {
    final List responseData = response.data;
    final List<Movies> movies = responseData.map((e) {
      final movie = Movies.fromJson(e);
      return movie;
    }).toList();
    return movies;
  } else {
    print('Failed to load data');
  }
});
