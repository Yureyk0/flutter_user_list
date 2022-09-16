import 'dart:convert';

import 'package:flutter_user_list/services/models/models.dart';
import 'package:http/http.dart' as http;

// import 'constants.dart';

class UserListApiClient {
  Future<List<ItemInfoModel>> getUserList() async {
    // final queryParameters = {
    //   'client_id': Constants.APP_ID,
    // };
    final userListRequest = Uri.parse(
        'https://api.unsplash.com/photos/?client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9');
    final response = await http.get(userListRequest);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);

      return (result).map((person) => ItemInfoModel.fromJson(person)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
