import 'dart:convert';

import 'package:flutter_user_list/services/models/models.dart';
import 'package:http/http.dart';

import 'constants.dart';

class UserListApiClient {
  Future<List<ItemInfoModel>> getUserList() async {
    final queryParameters = {
      'client_id': Constants.APP_ID,
    };
    final userListRequest = Uri.https(
        Constants.BASE_SCHEME, Constants.BASE_URL_DOMAIN, queryParameters);
    Response response = await get(userListRequest);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => ItemInfoModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
