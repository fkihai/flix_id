import 'package:flix_id/domain/usecases/top_up/top_up.dart';
import 'package:flix_id/presentation/providers/repositories/transaction_repository/transaction_repository_provider.dart';
import 'package:flix_id/presentation/providers/repositories/user_repostory/user_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_up_provider.g.dart';

@riverpod
TopUp topUp(Ref ref) => TopUp(
    userRepository: ref.watch(userRepositoryProvider),
    transactionRepository: ref.watch(transactionRepositoryProvider));
