import 'package:flix_id/data/repositories/movie_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/get_actors/get_actors_param.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

import '../../entities/actor.dart';

class GetActors implements Usecase<Result<List<Actor>>, GetActorsParam> {
  final MovieRepository _movieRepository;

  GetActors({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<List<Actor>>> call(GetActorsParam param) async {
    var getActorResult = await _movieRepository.getActors(id: param.movieId);
    return switch (getActorResult) {
      Success(value: final actorList) => Result.success(actorList),
      Failed(:final message) => Result.failed(message)
    };
  }
}
