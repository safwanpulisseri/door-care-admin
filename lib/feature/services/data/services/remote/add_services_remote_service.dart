import 'dart:developer';
import 'package:dio/dio.dart';

class AddServicesRemoteService {
  final String _link = "http://127.0.0.1:3000/api/admin/"; // Adjusted for web
  //final String _link = "http://10.0.2.2:3000/api/admin/"; // For android
  //final String _link = "http://127.0.0.1:3000/api/admin/"; // For iOS simulator

  final Dio dio = Dio();

  Future<Response<dynamic>> addNewService({
    required String token,
    required String serviceName,
    required num firstHourCharge,
    required num laterHourCharge,
    required String description,
    required String serviceImg,
  }) async {
    log("on add new service in dio");
    try {
      //log("auth token in acceptRejectWorker: $token, id: $id, status: $status");

      var response = await dio.post(
        "${_link}createService",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'serviceName': serviceName,
          'firstHourCharge': firstHourCharge,
          'laterHourCharge': laterHourCharge,
          'description': description,
          'service_img': serviceImg,
        },
      );
      log("success");
      return response;
    } catch (e) {
      log("Error add new service: $e");
      throw Exception("Failed to add new service");
    }
  }
}
