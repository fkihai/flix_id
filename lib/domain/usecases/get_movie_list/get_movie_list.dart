import 'package:flix_id/data/repositories/movie_repository.dart';
import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/get_movie_list/get_movie_list_param.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class GetMovieList implements Usecase<Result<List<Movie>>, GetMovieListParam> {
  final MovieRepository _movieRepository;

  GetMovieList({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<List<Movie>>> call(GetMovieListParam param) async {
    var movieResult = switch (param.category) {
      MovieListCategories.nowPlaying =>
        await _movieRepository.getNowPlaying(page: param.page),
      MovieListCategories.upcoming =>
        await _movieRepository.getUpcaming(page: param.page),
    };

    return switch (movieResult) {
      Success(value: final movie) => Result.success(movie),
      Failed(:final message) => Result.failed(message)
    };
  }
}
