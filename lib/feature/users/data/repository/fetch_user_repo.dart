import 'dart:developer';
import 'package:doorcareadmin/feature/auth/data/service/local/auth_local_service.dart';
import 'package:doorcareadmin/feature/users/data/model/fetch_user_model.dart';
import 'package:doorcareadmin/feature/users/data/service/remote/remote_service_fetch_user.dart';

class FetchUserRepo {
  final UserRemoteService _fetchUserService;
  final AuthLocalService _authLocalService;

  FetchUserRepo(this._fetchUserService, this._authLocalService);

  Future<List<FetchUserModel>> fetchUsersAllDetails() async {
    try {
      final String? token = await _authLocalService.getToken();
      if (token == null) {
        throw Exception('No token found');
      }

      var response = await _fetchUserService.fetchUsersDetails(token);

      if (response.statusCode == 200) {
        final List<dynamic> responseData =
            response.data['data'] as List<dynamic>;
        final List<FetchUserModel> fetchUserModel = responseData
            .map((user) => FetchUserModel.fromMap(user as Map<String, dynamic>))
            .toList();

        return fetchUserModel;
      } else {
        log('fetch user details failed${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      throw Exception();
    }
  }
}
