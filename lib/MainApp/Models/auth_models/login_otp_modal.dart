// To parse this JSON data, do
//
//     final loginModal = loginModalFromJson(jsonString);

import 'dart:convert';

LoginModal loginModalFromJson(String str) =>
    LoginModal.fromJson(json.decode(str));

String loginModalToJson(LoginModal data) => json.encode(data.toJson());

class LoginModal {
  String status;
  dynamic message;
  String userId;
  String name;
  String email;
  String balance;
  String mobile;

  LoginModal({
    this.status,
    this.message,
    this.userId,
    this.name,
    this.email,
    this.balance,
    this.mobile,
  });

  factory LoginModal.fromJson(Map<String, dynamic> json) => LoginModal(
        status: json["status"],
        message: json["message"],
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        balance: json["balance"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user_id": userId,
        "name": name,
        "email": email,
        "balance": balance,
        "mobile": mobile,
      };
}
