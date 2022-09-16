import 'package:flutter_user_list/services/models/models.dart';

class ItemInfoModel {
  final UrlsModel urls;
  final UserModel user;

  ItemInfoModel({required this.urls, required this.user});
  factory ItemInfoModel.fromJson(Map<String, dynamic> json) {
    return ItemInfoModel(
      urls: json['urls'],
      user: json['user'],
    );
  }
}
