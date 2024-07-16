import 'dart:developer';
import 'package:doorcareadmin/feature/users/data/service/remote/remote_service_fetch_user.dart';
import '../service/local/auth_local_service.dart';
import '../service/remote/auth_remote_service.dart';
import '../model/user_model.dart';

class AuthRepo {
  final AuthRemoteService _authService;
  final AuthLocalService _authLocalService;

  AuthRepo(this._authService, this._authLocalService);

  Future<UserModel?> getUser() async {
    final UserModel? userModel = await _authLocalService.getUser();
    if (userModel != null) {
      return userModel;
    } else {
      return null;
    }
  }

  Future<void> signOut() async {
    await _authLocalService.removeUser();
  }

  Future<UserModel> emailSignIn({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _authService.signIn(
        email: email,
        password: password,
      );

      if (response.statusCode == 200) {
        final token = response.data['token'];

        log(token.toString());

        final Map<String, dynamic> responseData =
            response.data['data'] as Map<String, dynamic>;
        final UserModel userModel = UserModel.fromMap(responseData);
        _authLocalService.saveUser(userModel);
        return userModel;
      } else {
        log('Login failed${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      throw Exception();
    }
  }
}
