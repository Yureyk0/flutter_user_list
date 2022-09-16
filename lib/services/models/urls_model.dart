class UrlsModel {
  final String raw;
  final String full;
  final String regular;

  UrlsModel({required this.regular, required this.raw, required this.full});

  factory UrlsModel.fromJson(Map<String, dynamic> json) {
    return UrlsModel(
      regular: json['regular'],
      raw: json['raw'],
      full: json['full'],
    );
  }
}
