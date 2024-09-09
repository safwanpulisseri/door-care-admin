import 'dart:developer';
import 'package:doorcareadmin/feature/services/data/model/fetch_all_service_model.dart';
import '../services/remote/fetch_all_services_remote_service.dart';

class FetchAllServiceRepo {
  final FetchAllServicesRemoteService _fetchAllServicesRemoteService;

  FetchAllServiceRepo(
    this._fetchAllServicesRemoteService,
  );

  Future<List<FetchAllServiceModel>> fetchServicesDetails() async {
    try {
      var response =
          await _fetchAllServicesRemoteService.fetchAllServiceDetails();

      if (response.statusCode == 200) {
        final List<dynamic> responseData =
            response.data['data'] as List<dynamic>;
        final List<FetchAllServiceModel> fetchAllServiceModel = responseData
            .map((service) =>
                FetchAllServiceModel.fromMap(service as Map<String, dynamic>))
            .toList();

        return fetchAllServiceModel;
      } else {
        log('fetch service details failed${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      throw Exception();
    }
  }
}
