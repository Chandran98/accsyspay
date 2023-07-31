// To parse this JSON data, do
//
//     final statusCheckModal = statusCheckModalFromJson(jsonString);

import 'dart:convert';

StatusCheckModal statusCheckModalFromJson(String str) =>
    StatusCheckModal.fromJson(json.decode(str));

String statusCheckModalToJson(StatusCheckModal data) =>
    json.encode(data.toJson());

class StatusCheckModal {
  String status;
  String message;

  StatusCheckModal({
    this.status,
    this.message,
  });

  factory StatusCheckModal.fromJson(Map<String, dynamic> json) =>
      StatusCheckModal(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
