import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource actorsDatasource;

  ActorRepositoryImpl(this.actorsDatasource);

  @override
  Future<List<Actor>> getActorByMovie(String movieId) {
    return actorsDatasource.getActorByMovie(movieId);
  }
}
