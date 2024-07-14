import 'dart:developer';
import 'package:dio/dio.dart';

class UserRemoteService {
  final String _link = "http://127.0.0.1:3000/api/admin/getUsers";

  final Dio dio;

  UserRemoteService() : dio = Dio() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log("Request [${options.method}] => PATH: ${options.path}");
          log("Request Data: ${options.data}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          log("Response [${response.statusCode}] => PATH: ${response.requestOptions.path}");
          log("Response Data: ${response.data}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          log("Error [${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
          log("Error Message: ${e.message}");
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response<dynamic>> fetchUsers() async {
    try {
      var response = await dio.get(_link);
      return response;
    } catch (e) {
      log('Error during fetch users $e');
      throw Exception();
    }
  }
}
