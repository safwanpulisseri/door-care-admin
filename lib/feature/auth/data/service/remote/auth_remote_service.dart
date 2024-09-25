import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthRemoteService {
  final String _link = dotenv.env['API_LINK']!;

  final dio = Dio();

  // User sign in
  Future<Response<dynamic>> signIn({
    required String email,
    required String password,
  }) async {
    log("on dio");
    log(email);
    log(password);
    log("to be enter try catch");
    try {
      var response = await dio.post(
        "${_link}login",
        data: {
          'email': email,
          'password': password,
        },
      );
      log("success");
      return response;
    } catch (e) {
      log('Error during login $e');
      throw Exception();
    }
  }
}
