import 'dart:developer';
import '../service/local/auth_local_service.dart';
import '../service/remote/auth_remote_service.dart';
import '../model/user_model.dart';

class AuthRepo {
  final AuthRemoteService _authService;

  AuthRepo(
    this._authService,
  );

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
        final Map<String, dynamic> responseData =
            response.data['data'] as Map<String, dynamic>;
        final UserModel userModel = UserModel.fromMap(responseData);
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
