class UserModel {
  final String name;
  final ProfileImageModel profileImage;

  UserModel({required this.name, required this.profileImage});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: json['name'], profileImage: json['profile_image']);
  }
}

class ProfileImageModel {
  final String medium;

  ProfileImageModel({required this.medium});
  factory ProfileImageModel.fromJson(Map<String, dynamic> json) {
    return ProfileImageModel(medium: json['medium']);
  }
}
