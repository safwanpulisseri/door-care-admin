import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:doorcareadmin/feature/auth/data/service/local/auth_local_service.dart';
import '../services/remote/add_services_remote_service.dart';

class AddServicesRepo {
  final AddServicesRemoteService _addServicesRemoteService;
  final AuthLocalService _authLocalService;

  AddServicesRepo(
    this._addServicesRemoteService,
    this._authLocalService,
  );

  Future<Response<dynamic>> addNewServices({
    required String serviceName,
    required int firstHourCharge,
    required int laterHourCharge,
    required String description,
    required String serviceImg,
  }) async {
    try {
      String? token = await _authLocalService.getToken();
      if (token == null) {
        throw Exception('No token Found');
      }
      var response = await _addServicesRemoteService.addNewService(
        token: token,
        serviceName: serviceName,
        firstHourCharge: firstHourCharge,
        laterHourCharge: laterHourCharge,
        description: description,
        serviceImg: serviceImg,
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        log('Failed to add new service in Repo${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      throw Exception();
    }
  }
}
