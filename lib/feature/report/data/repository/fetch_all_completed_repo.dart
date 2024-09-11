import 'dart:developer';
import '../../../auth/data/service/local/auth_local_service.dart';
import '../model/fetch_all_completed_service_model.dart';
import '../service/remote/fetch_all_completed_remote.dart';

class FetchAllCompletedRepo {
  final FetchAllCompletedRemote _fetchAllCompletedRemote;
  final AuthLocalService _authLocalService;

  FetchAllCompletedRepo(
    this._fetchAllCompletedRemote,
    this._authLocalService,
  );

  Future<List<FetchAllCompletedServiceModel>>
      fetchAllCompletedRemoteServiceDetails() async {
    try {
      String? token = await _authLocalService.getToken();
      if (token == null) {
        throw Exception('No token Found');
      }

      var response =
          await _fetchAllCompletedRemote.fetchAllCompletedRemoteService(
        token: token,
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData =
            response.data['data'] as List<dynamic>;
        final List<FetchAllCompletedServiceModel> fetchAllServiceModel =
            responseData
                .map((service) => FetchAllCompletedServiceModel.fromMap(
                    service as Map<String, dynamic>))
                .toList();

        return fetchAllServiceModel;
      } else {
        log('fetchAllCompletedRemoteService failed${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      throw Exception();
    }
  }
}
