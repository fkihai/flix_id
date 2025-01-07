import 'package:flix_id/data/repositories/movie_repository.dart';
import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/get_movie_detail/get_movie_detail_param.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class GetMovieDetail
    implements Usecase<Result<MovieDetail>, GetMovieDetailParam> {
  final MovieRepository _movieRepository;
  GetMovieDetail({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<MovieDetail>> call(GetMovieDetailParam param) async {
    var movieDetailResult =
        await _movieRepository.getDetail(id: param.movie.id);
    return switch (movieDetailResult) {
      Success(value: final movieDeatail) => Result.success(movieDeatail),
      Failed(:final message) => Result.failed(message)
    };
  }
}
