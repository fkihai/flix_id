import 'package:flix_id/data/repositories/user_repository.dart';
import 'package:flix_id/domain/usecases/upload_profile_picture/upload_profile_picture_param.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

import '../../entities/result.dart';
import '../../entities/user.dart';

class UploadProfilePicture
    implements Usecase<Result<User>, UploadProfilePictureParam> {
  final UserRepository _userRepository;

  UploadProfilePicture({required UserRepository userRepository})
      : _userRepository = userRepository;
  @override
  Future<Result<User>> call(UploadProfilePictureParam param) async =>
      await _userRepository.uploadProfilePicture(
          user: param.user, imageFile: param.imageFile);
}
