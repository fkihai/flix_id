import 'package:flix_id/domain/usecases/create_transaction/create_transaction.dart';
import 'package:flix_id/presentation/providers/repositories/transaction_repository/transaction_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_transaction_provider.g.dart';

@riverpod
CreateTransaction createTransaction(Ref ref) => CreateTransaction(
    transactionRepository: ref.watch(transactionRepositoryProvider));
