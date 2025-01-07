import 'package:flix_id/domain/entities/actor.dart';
import 'package:flix_id/domain/entities/result.dart';

import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';

abstract interface class MovieRepository {
  Future<Result<List<Movie>>> getNowPlaying({int page = 1});
  Future<Result<List<Movie>>> getUpcaming({int page = 1});
  Future<Result<MovieDetail>> getDetail({required int id});
  Future<Result<List<Actor>>> getActors({required int id});
}
