import 'package:dio/dio.dart';
import 'package:flix_id/data/repositories/movie_repository.dart';
import 'package:flix_id/domain/entities/actor.dart';
import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flutter/material.dart';

class TmdbMovieRepository implements MovieRepository {
  final Dio? _dio;
  final String _accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ODhmZTVjMTVkZTIxMTZjNWJhODcwNTM2ODRhNTA3ZCIsIm5iZiI6MTczNTYxMzc5OC41NjcwMDAyLCJzdWIiOiI2NzczNWQ2NmZiZTM3MjJhOTg2MTc2YzEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.D60Z8jjnu0JwSXnFJzHCYR0hECCLQ58BQCmX8gAKpnE";

  late final Options _options = Options(headers: {
    'Authorization': 'Bearer $_accessToken',
    'accept': 'application/json'
  });

  TmdbMovieRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<List<Actor>>> getActors({required int id}) async {
    try {
      final response = await _dio!.get(
        'https://api.themoviedb.org/3/movie/558449/credits?language=en-US',
        options: _options,
      );
      final results = List<Map<String, dynamic>>.from(response.data['cast']);
      return Result.success(results.map((e) => Actor.formJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<MovieDetail>> getDetail({required int id}) async {
    try {
      final response = await _dio!.get(
        'https://api.themoviedb.org/3/movie/$id?language=en-US',
        options: _options,
      );

      return Result.success(MovieDetail.formJSON(response.data));
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  Future<Result<List<Movie>>> _getMovie(String category, {int page = 1}) async {
    try {
      final response = await _dio!.get(
        'https://api.themoviedb.org/3/movie/$category?language=en-US&page=$page',
        options: _options,
      );
      final results = List<Map<String, dynamic>>.from(response.data['results']);
      return Result.success(results.map((e) => Movie.formJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({int page = 1}) {
    return _getMovie(_MovieCategory.nowPlaying.toString(), page: page);
  }

  @override
  Future<Result<List<Movie>>> getUpcaming({int page = 1}) {
    return _getMovie(_MovieCategory.upcoming.toString(), page: page);
  }
}

enum _MovieCategory {
  nowPlaying('now_playing'),
  upcoming('upcoming');

  final String _instring;
  const _MovieCategory(String instring) : _instring = instring;

  @override
  String toString() => _instring;
}
