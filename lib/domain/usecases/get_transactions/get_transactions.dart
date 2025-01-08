import 'package:flix_id/data/repositories/transaction_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/get_transactions/get_transactions_param.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

import '../../entities/transaction.dart';

class GetTransactions
    implements Usecase<Result<List<Transaction>>, GetTransactionsParam> {
  final TransactionRepository _transactionRepository;

  GetTransactions({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<Transaction>>> call(GetTransactionsParam param) async {
    var transactionListResult =
        await _transactionRepository.getUserTransactions(uid: param.uid);
    return switch (transactionListResult) {
      Success(value: final transactionList) => Result.success(transactionList),
      Failed(:final message) => Result.failed(message)
    };
  }
}
