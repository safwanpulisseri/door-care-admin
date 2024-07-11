import 'dart:developer';
import 'package:dio/dio.dart';

class AuthRemoteService {
  final String _link = "http://localhost:3000/api/admin/"; // Adjusted for web
  //final String _link = "http://10.0.2.2:3000/api/admin/"; // For android
  //final String _link = "http://127.0.0.1:3000/api/admin/"; // For iOS simulator

  final dio = Dio();

  //User sign in
  Future<Response<dynamic>> signIn({
    required String email,
    required String password,
  }) async {
    log("on dio");
    log(email);
    log(password);
    log("to be enter try catch");
    try {
      var response =
          await dio.post("http://localhost:3000/api/admin/login", data: {
        'email': "admin@gmail.com",
        'password': "123456",
      });
      log("success");
      return response;
    } catch (e) {
      log('Error during login $e');
      throw Exception();
    }
  }
}
