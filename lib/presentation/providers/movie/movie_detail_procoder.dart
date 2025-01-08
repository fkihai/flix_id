import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/get_movie_detail/get_movie_detail.dart';
import 'package:flix_id/domain/usecases/get_movie_detail/get_movie_detail_param.dart';
import 'package:flix_id/presentation/providers/usecases/get_movie_detail_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/movie.dart';

part 'movie_detail_procoder.g.dart';

@riverpod
Future<MovieDetail?> movieDetail(Ref ref, {required Movie movie}) async {
  GetMovieDetail getMovieDetail = ref.read(getMovieDetailProvider);
  var movieDetailResult =
      await getMovieDetail(GetMovieDetailParam(movie: movie));
  return switch (movieDetailResult) {
    Success(value: final movieDetail) => movieDetail,
    Failed(message: _) => null
  };
}
