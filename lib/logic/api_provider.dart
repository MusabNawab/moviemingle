import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviemingle/data/models/movies.dart';

final apiDataProvider = FutureProvider.autoDispose((ref) async {
  const url = "https://api.tvmaze.com/search/shows?q=all";
  final dio = Dio();
  try {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final List responseData = response.data;
      final List<Movies> movies = responseData.map((e) {
        final movie = Movies.fromJson(e);
        return movie;
      }).toList();
      return movies;
    }
  } catch (e) {
    print(e.toString());
  }
});
