import 'dart:developer';
import 'package:doorcareadmin/feature/users/data/service/remote/remote_service_fetch_user.dart';
import '../service/local/auth_local_service.dart';
import '../service/remote/auth_remote_service.dart';
import '../model/user_model.dart';

class AuthRepo {
  final AuthRemoteService _authService;
  final AuthLocalService _authLocalService;

  AuthRepo(this._authService, this._authLocalService);

  Future<String?> getToken() async {
    final String? authToken = await _authLocalService.getToken();
    if (authToken != null) {
      return authToken;
    } else {
      return null;
    }
  }

  Future<void> signOut() async {
    await _authLocalService.removeToken();
  }

  Future<String> emailSignIn({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _authService.signIn(
        email: email,
        password: password,
      );

      if (response.statusCode == 200) {
        print(response.data);
        final token = response.data['token'] as String;
        log("Token received: $token");

        await _authLocalService.saveToken(token);
        return token;
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
