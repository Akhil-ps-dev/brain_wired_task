

import '../repository/user_repository.dart';
import 'user_model.dart';

class UserViewModel {
  final _rep = UserRepository();

  Future<UserModel> getUserDetails() async {
    final response = await _rep.getUserDetails();
    return response;
  }
}
