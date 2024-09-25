import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserRemoteService {
  final String _link = dotenv.env['API_LINK']!;

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
