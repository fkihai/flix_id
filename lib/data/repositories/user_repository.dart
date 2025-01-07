import 'dart:io';

import 'package:flix_id/domain/entities/result.dart';
import 'package:flutter/rendering.dart';

import '../../domain/entities/user.dart';

abstract class UserRepository {
  Future<Result<User>> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    int balance = 0,
  });

  Future<Result<User>> getUser({required String uid});
  Future<Result<User>> updateUser({required User user});
  Future<Result<int>> getUserBalance({required String uid});
  Future<Result<User>> updateUserBalance({
    required String uid,
    required int balance,
  });
  Future uploadProfilePicture({
    required User user,
    required File imageFile,
  });
}
