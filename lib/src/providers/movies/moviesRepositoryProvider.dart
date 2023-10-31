// ignore_for_file: file_names
import 'package:cinemapedia/infrastructure/datasources/moviedbDatasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movieRepositoryImpl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// repositorio inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});