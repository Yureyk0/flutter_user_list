import 'package:flutter_user_list/services/api/user_list_api_client.dart';

import '../models/models.dart';

class ApiRepository {
  final userListApiClient = UserListApiClient();
  Future<List<ItemInfoModel>> getUserList() => userListApiClient.getUserList();
}
