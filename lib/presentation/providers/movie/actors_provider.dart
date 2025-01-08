import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/get_actors/get_actors.dart';
import 'package:flix_id/domain/usecases/get_actors/get_actors_param.dart';
import 'package:flix_id/presentation/providers/usecases/get_actors_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/actor.dart';

part 'actors_provider.g.dart';

@riverpod
Future<List<Actor>> actors(Ref ref, {required int movieId}) async {
  GetActors getActors = ref.read(getActorsProvider);

  var actorsResult = await getActors(GetActorsParam(movieId: movieId));

  return switch (actorsResult) {
    Success(value: final actors) => actors,
    Failed(message: _) => const []
  };
}
