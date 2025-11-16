class ProfileDataModel {
  final String name;
  final String email;
  final String? address;
  final String? visa;
  final String? image;
  ProfileDataModel({
    required this.name,
    required this.email,
    this.address,
    this.visa,
    this.image,
  });

  factory ProfileDataModel.fromMap(Map<String, dynamic> map) {
    return ProfileDataModel(
      name: map['name'] as String,
      email: map['email'] as String,
      address: map['address'] as String?,
      visa: map['Visa'] as String?,
      image: map['image'] as String?,
    );
  }
}
