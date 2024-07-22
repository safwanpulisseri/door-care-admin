import 'dart:developer';
import 'package:doorcareadmin/feature/auth/data/service/local/auth_local_service.dart';
import 'package:doorcareadmin/feature/requests/data/model/requested_workers_model.dart';
import 'package:doorcareadmin/feature/requests/data/service/remote/remote_service_fetch_requested_worker.dart';

class FetchRequestedWorkerRepo {
  final RequestedWorkerRemoteService _requestedWorkerRemoteService;
  final AuthLocalService _authLocalService;
  FetchRequestedWorkerRepo(
    this._requestedWorkerRemoteService,
    this._authLocalService,
  );

  Future<List<FetchWorkerModel>> fetchUsersAllDetails() async {
    try {
      String? token = await _authLocalService.getToken();
      if (token == null) {
        throw Exception('No token Found');
      }
      var response =
          await _requestedWorkerRemoteService.fetchWokersDetails(token);
      if (response.statusCode == 200) {
        final List<dynamic> responseData =
            response.data['data'] as List<dynamic>;
        final List<FetchWorkerModel> requestedWorkerModel = responseData
            .map((user) =>
                FetchWorkerModel.fromMap(user as Map<String, dynamic>))
            .toList();
        return requestedWorkerModel;
      } else {
        log("Failed to fetch workers details${response.statusCode}");
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      throw Exception();
    }
  }
}
