import 'package:flix_id/data/repositories/transaction_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/create_transaction/create_transaction_param.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class CreateTransaction
    implements Usecase<Result<void>, CreateTransactionParam> {
  final TransactionRepository _transactionRepository;

  CreateTransaction({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(CreateTransactionParam param) async {
    int transactionTime = DateTime.now().millisecondsSinceEpoch;
    var result = await _transactionRepository.createTransaction(
        transaction: param.transaction.copyWith(
      transactionTime: transactionTime,
      id: (param.transaction.id == null)
          ? 'flx-$transactionTime-${param.transaction.id}'
          : param.transaction.id,
    ));
    return switch (result) {
      Success(value: _) => const Result.success(null),
      Failed(:final message) => Result.failed(message)
    };
  }
}
