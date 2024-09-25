import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AddServicesRemoteService {
  final String _link = dotenv.env['API_LINK']!;

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
      log("auth token in token: $token, serviceName: $serviceName, firstHourCharge: $firstHourCharge , laterHourCharge :$laterHourCharge,description:$description,serviceImg:$serviceImg");

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
