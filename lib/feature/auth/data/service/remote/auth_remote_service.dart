import 'dart:developer';
import 'package:dio/dio.dart';

class AuthRemoteService {
  final String _link = "http://127.0.0.1:3000/api/admin/"; // Adjusted for web
  //final String _link = "http://10.0.2.2:3000/api/admin/"; // For android
  //final String _link = "http://127.0.0.1:3000/api/admin/"; // For iOS simulator

  final Dio dio;

  AuthRemoteService() : dio = Dio() {
    // Adding interceptors
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Modify or log the request
          log("Request [${options.method}] => PATH: ${options.path}");
          log("Request Data: ${options.data}");
          // Continue with the request
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Modify or log the response
          log("Response [${response.statusCode}] => PATH: ${response.requestOptions.path}");
          log("Response Data: ${response.data}");
          // Continue with the response
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // Handle or log errors
          log("Error [${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
          log("Error Message: ${e.message}");
          // Continue with the error
          return handler.next(e);
        },
      ),
    );
  }

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
      var response = await dio.post("${_link}login", data: {
        'email': email,
        'password': password,
      });
      log("success");
      return response;
    } catch (e) {
      log('Error during login $e');
      throw Exception();
    }
  }
}
