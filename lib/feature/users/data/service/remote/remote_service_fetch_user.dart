import 'dart:developer';
import 'package:dio/dio.dart';

String authtoken = "";

class UserRemoteService {
  final String _link = "http://127.0.0.1:3000/api/admin/"; // For android
  //final String _link = "http://127.0.0.1:3000/api/admin/"; // For iOS simulator
  //final String _link = "http://127.0.0.1:3000/api/admin/"; // Adjusted for web

  final Dio dio = Dio();

  Future<Response<dynamic>> fetchUsersDetails() async {
    log("on get all users dio");
    try {
      log(authtoken);
      var response = await dio.get("http://localhost:3000/api/admin/getUsers",
          options: Options(
            headers: {
              'Authorization': 'Bearer $authtoken',
            },
          ));
      log("success");
      return response;
    } catch (e) {
      log('Error during fetching Users $e');
      throw Exception();
    }
  }
}
