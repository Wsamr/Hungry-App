class DataModel {
  final String token;
  final String name;
  final String email;
  final String? image;

  DataModel({
    required this.token,
    required this.name,
    required this.email,
    required this.image,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      token: json['token'],
      name: json['name'],
      email: json['email'],
      image: json['image'] ?? null,
    );
  }
}
