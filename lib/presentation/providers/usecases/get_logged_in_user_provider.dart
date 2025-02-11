import 'package:flix_id/domain/usecases/get_logged_in_user/get_logged_in_user.dart';
import 'package:flix_id/presentation/providers/repositories/authentication/authentication_provider.dart';
import 'package:flix_id/presentation/providers/repositories/user_repostory/user_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_logged_in_user_provider.g.dart';

@riverpod
GetLoggedInUser getLoggedInUser(Ref ref) => GetLoggedInUser(
    authentication: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider));
