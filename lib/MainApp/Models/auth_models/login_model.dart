
// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
         this.status,
         this.userId,
         this.name,
         this.email,
         this.mobile,
         this.balance,
    });

    String status;
    String userId;
    String name;
    String email;
    String balance;
    String mobile;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        balance: json["balance"],
        mobile: json["mobile"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "user_id": userId,
        "name": name,
        "email": email,
        "balance": balance,
        "mobile": mobile,
    };
}
