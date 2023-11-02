// ignore_for_file: file_names
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/src/providers/movies/moviesProviders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref){
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingMovies.isEmpty) return [];
  
  return nowPlayingMovies.sublist(0,6);
});