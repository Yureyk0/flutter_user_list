class UrlsModel {
  final String raw;
  final String full;

  UrlsModel({required this.raw, required this.full});

  factory UrlsModel.fromJson(Map<String, dynamic> json) {
    return UrlsModel(
      raw: json['raw'],
      full: json['full'],
    );
  }
}
