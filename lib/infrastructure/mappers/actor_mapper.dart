import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'http://images.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://lovely-talks.com/assets/male_avatar.jpeg',
      character: cast.character);
}
