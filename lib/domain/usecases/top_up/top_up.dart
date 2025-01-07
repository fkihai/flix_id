import 'package:flix_id/data/repositories/transaction_repository.dart';
import 'package:flix_id/data/repositories/user_repository.dart';
import 'package:flix_id/domain/entities/transaction.dart';
import 'package:flix_id/domain/usecases/create_transaction/create_transaction.dart';
import 'package:flix_id/domain/usecases/create_transaction/create_transaction_param.dart';
import 'package:flix_id/domain/usecases/top_up/top_up_param.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

import '../../entities/result.dart';

class TopUp implements Usecase<Result<void>, TopUpParam> {
  final TransactionRepository _transactionRepository;

  TopUp(
      {required UserRepository userRepository,
      required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(TopUpParam param) async {
    CreateTransaction createTransaction =
        CreateTransaction(transactionRepository: _transactionRepository);

    int transactionTime = DateTime.now().microsecondsSinceEpoch;

    var createTransactionResult = await createTransaction(
      CreateTransactionParam(
        transaction: Transaction(
          uid: 'flixtp-$transactionTime-${param.userId}',
          title: 'Top Up',
          adminFee: 0,
          total: -param.amount,
          transactionTime: transactionTime,
        ),
      ),
    );
    return switch (createTransactionResult) {
      Success(value: _) => const Result.success(null),
      Failed(message: _) => const Result.failed('failed to top up')
    };
  }
}
