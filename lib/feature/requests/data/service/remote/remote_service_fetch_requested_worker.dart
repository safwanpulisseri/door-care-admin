import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RequestedWorkerRemoteService {
  final String _link = dotenv.env['API_LINK']!;

  final Dio dio = Dio();

  Future<Response<dynamic>> fetchWokersDetails(String token) async {
    log("on get all workers dio");
    try {
      log("auth token in fetchWokersDetails : $token");
      var response = await dio.get(
        "${_link}getJoinRequests",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      log("success");
      return response;
    } catch (e) {
      log("Error getting all workers: $e");
      throw Exception();
    }
  }

  Future<Response<dynamic>> acceptRejectWorker(
      String token, String id, String status) async {
    log("on accept/reject worker dio");
    try {
      log("auth token in acceptRejectWorker: $token, id: $id, status: $status");
      var response = await dio.patch(
        "${_link}worker/accept-rejectRequest",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'id': id,
          'status': status,
        },
      );
      log("success");
      return response;
    } catch (e) {
      log("Error accepting/rejecting worker: $e");
      throw Exception("Failed to accept/reject worker");
    }
  }
}
