

import 'dart:convert';

OtpCheck otpCheckFromJson(String str) => OtpCheck.fromJson(json.decode(str));

String otpCheckToJson(OtpCheck data) => json.encode(data.toJson());

class OtpCheck {
    OtpCheck({
         this.status,
         this.message,
    });

    String status;
    String message;

    factory OtpCheck.fromJson(Map<String, dynamic> json) => OtpCheck(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
