class UserModel {
  late String message;
  late User user;

  UserModel({required this.message, required this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = User.fromJson(json['user']);
  }
}

class User {
  late String sId;
  late String username;
  late String email;

  User({required this.sId, required this.username, required this.email});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? "";
    username = json['username'] ?? "";
    email = json['email'] ?? "";
  }
}
