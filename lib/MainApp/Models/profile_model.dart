// To parse this JSON data, do
//
//     final profileModal = profileModalFromJson(jsonString);

import 'dart:convert';

ProfileModal profileModalFromJson(String str) => ProfileModal.fromJson(json.decode(str));

String profileModalToJson(ProfileModal data) => json.encode(data.toJson());

class ProfileModal {
    String status;
    String name;
    String email;
    String balance;
    String mobile;

    ProfileModal({
        this.status,
        this.name,
        this.email,
        this.balance,
        this.mobile,
    });

    factory ProfileModal.fromJson(Map<String, dynamic> json) => ProfileModal(
        status: json["status"],
        name: json["name"],
        email: json["email"],
        balance: json["balance"],
        mobile: json["mobile"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "name": name,
        "email": email,
        "balance": balance,
        "mobile": mobile,
    };
}
