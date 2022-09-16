// class UserModel {
//   final String name;
//   final ProfileImageModel profileImage;

//   UserModel({required this.name, required this.profileImage});

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(name: json['name'], profileImage: json['profile_image']);
//   }
// }

class UserModel {
  String? name;

  ProfileImageModel? profileImage;

  UserModel({
    required this.name,
    required this.profileImage,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];

    profileImage = json['profile_image'] != null
        ? ProfileImageModel.fromJson(json['profile_image'])
        : null;
  }
}

class ProfileImageModel {
  String? small;
  String? medium;

  ProfileImageModel({this.small, this.medium});

  ProfileImageModel.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
  }
}
