// user_repo.dart
import 'package:dio/dio.dart';
import 'package:doorcareadmin/feature/users/data/model/fetch_user_model.dart';
import 'package:doorcareadmin/feature/users/data/service/remote/remote_service_fetch_user.dart';

class UserRepo {
  final Dio _dio = Dio();

  UserRepo(UserRemoteService userRemoteService);

  Future<List<FetchUserModel>> fetchUsers() async {
    final response = await _dio.get('http://127.0.0.1:3000/api/admin/getUsers');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'];
      return data.map((user) => FetchUserModel.fromMap(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
