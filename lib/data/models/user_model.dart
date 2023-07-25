class UserModel {
  final int userId;
  final int id;
  final String title;

  UserModel({required this.userId, required this.id, required this.title});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["userId"] as int? ?? 0,
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "",
    );
  }

}
