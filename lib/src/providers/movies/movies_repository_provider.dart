// ignore_for_file: file_names
import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// repositorio inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});