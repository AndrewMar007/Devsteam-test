class UserModel {
  String id;
  String username;
  String name;

  UserModel({this.id, this.username, this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      name: json['name'],
    );
  }
}
