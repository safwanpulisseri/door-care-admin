import 'dart:developer';
import 'package:dio/dio.dart';

//String token = "";

class UserRemoteService {
  final String _link = "http://127.0.0.1:3000/api/admin/"; // For android
  //final String _link = "http://127.0.0.1:3000/api/admin/"; // For iOS simulator
  //final String _link = "http://127.0.0.1:3000/api/admin/"; // Adjusted for web

  final Dio dio = Dio();

  Future<Response<dynamic>> fetchUsersDetails(String token) async {
    log("on get all users dio");
    try {
      log("auth token in fetchUsersDetails : $token");
      var response = await dio.get(
        "${_link}getUsers",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      log("success");
      return response;
    } catch (e) {
      log('Error during fetching Users $e');
      throw Exception();
    }
  }
}
