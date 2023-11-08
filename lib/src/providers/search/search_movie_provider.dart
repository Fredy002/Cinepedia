import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/src/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchMoviesProvider =
    StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);

  return SearchedMoviesNotifier(
      ref: ref, searchedMoviesCallback: movieRepository.searchMovies);
});

typedef SearchedMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchedMoviesCallback searchedMoviesCallback;
  final Ref ref;

  SearchedMoviesNotifier(
      {required this.ref, required this.searchedMoviesCallback})
      : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchedMoviesCallback(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;
    return movies;
  }
}
