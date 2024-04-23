// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginModel {
  String uuid = "";
  String email = "";
  String password = "";
  String role = "";
  LoginModel({
    required this.uuid,
    required this.email,
    required this.password,
    this.role = "",
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    uuid = json["uuid"] ?? "";
    email = json["email"] ?? "";
    password = json["password"] ?? "";
    role = json["role"] ?? "";
  }

  Map<String, dynamic> toJson(){
    return {
      "uuid" : uuid,
      "email" : email,
      "password" : password,
    };
  }

  LoginModel.empty();

  @override
  String toString() {
    return 'LoginModel{email: $email, _password: $password,}';
  }
}
